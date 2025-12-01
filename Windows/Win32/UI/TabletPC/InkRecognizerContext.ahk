#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Enables the ability to perform ink recognition, retrieve the recognition result, and retrieve alternates. The InkRecognizerContext enables the various recognizer that are installed on a system to use ink recognition to process input appropriately.
 * @remarks
 * This object can be instantiated by calling the [**CoCreateInstance**](/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance) method in C++.
 * 
 * There are two types of recognition: background (asynchronous) or foreground (synchronous). Background recognition is started by a call to the [**BackgroundRecognize**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-backgroundrecognize) or [**BackgroundRecognizeWithAlternates**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-backgroundrecognizewithalternates) methods, occurs on a background thread, and reports results to the application through an event mechanism. Foreground recognition does not return until all recognition is completed, thus making recognition results available to the calling thread without listening for the recognition event.
 * 
 * Ink is processed continuously in the background. If an [**IInkStrokeDisp**](/windows/desktop/api/msinkaut/nn-msinkaut-iinkstrokedisp) is added to the [InkStrokes](/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)) collection to which the **InkRecognizerContext** refers, then the **IInkStrokeDisp** is then recognized immediately. See remarks in the [**EndInkInput**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-endinkinput) method topic for more details.
 * 
 * All recognition occurs through a recognizer context. The context defines the settings for a single recognition session. It receives the ink that must be recognized and defines the constraints on the ink input and on the recognition output. The constraints that can be set on the context include the language, the dictionary, and grammar that is being used.
 * 
 * > [!Note]  
 * > Setting properties other than the [**Strokes**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_strokes) or [**CharacterAutoCompletion**](/windows/win32/api/msinkaut/nf-msinkaut-iinkrecognizercontext-get_characterautocompletionmode) properties succeeds only if the [InkStrokes](/previous-versions/windows/desktop/legacy/ms703293(v=vs.85)) collection is **NULL**. You must set the other properties before you attach the InkStrokes collection to the **InkRecognizerContext**, or you must set the InkStrokes collection to **NULL** and then set the other properties. If you set the InkStrokes collection to **NULL** and then set the other properties, you may have to reattach the InkStrokes collection. This is because the recognition starts right after you assign the InkStrokes to the **InkRecognizerContext**. When a call is made to [**Recognize Method \[InkRecognizeContext Class\]**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-recognize) or [**BackgroundRecognize**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-backgroundrecognize), call results might be available already.
 * 
 *  
 * 
 * To improve your application's performance, dispose of your **InkRecognizerContext** object when it is no longer needed.
 * @see https://learn.microsoft.com/windows/win32/tablet/inkrecognizercontext-class
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkRecognizerContext extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
