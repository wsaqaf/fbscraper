var max_count=1000;
var count = 0;
var found_retry = false;
var interrupted = 0;

function clickRetryButton() {
    var spans = document.querySelectorAll('span');

    for (var i = 0; i < spans.length; i++) {
        if (spans[i].textContent.trim() === "Retry") {
            spans[i].click();
            console.log("Found and clicked on 'Retry' link, continuing to scroll.");
            found_retry = true;
            break;
        }
    }

    if (!found_retry) {
        console.log("Retry link not found, continuing to scroll.");
    }
}

function reset()
	{
		count = 0;
		found_retry = false;
		interrupted = 0;
	}
	
function scrollPage() {
    if (count < max_count) {
        var oldScrollY = window.scrollY;
        var remainingHeight = document.documentElement.scrollHeight - oldScrollY - window.innerHeight;
		if (interrupted) { reset(); console.log("Interrupted!"); return; }
        window.scrollBy(0, Math.min(remainingHeight, window.innerHeight));
        console.log("#" + count);
        if (count % 20 === 0) 
        	{ 
        		if (!found_retry) { console.log("Checking Retry link.."); clickRetryButton(); }
        		else { 
        			console.log("Found 'Retry' link, but link failed, starting countdown.")
        			startCountdown(15);
        			return; 
        		}
        	}        
		count++;
		var randomDelay = Math.random() * 1000;
		setTimeout(scrollPage, randomDelay);
    }
}

function startCountdown(minutes) {
    var remainingSeconds = minutes * 60;

    console.log("Countdown started for " + minutes + " minutes.");

    var countdown = setInterval(function() {
        remainingSeconds--;
        var mins = Math.floor(remainingSeconds / 60);
        var secs = remainingSeconds % 60;

        if (interrupted) { 
            clearInterval(countdown); 
            reset(); 
            console.log("Interrupted!"); 
            return; 
        }

        // Log remaining time
        console.log(mins + " minute(s) and " + secs + " second(s) remaining...");

        if (remainingSeconds <= 0) {
            clearInterval(countdown);
            clickRetryButton();
            count = 0;
            found_retry = false;
            scrollPage();
        }
    }, 1000); // Update every second
}

scrollPage();
