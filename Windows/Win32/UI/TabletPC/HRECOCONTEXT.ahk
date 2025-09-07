#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * An HRECOCONTEXT handle is used to add ink to the context, perform ink recognition (synchronously or asynchronously), retrieve the recognition result, and retrieve alternates.
 * @remarks
 * The following are the **HRECOCONTEXT** functions
  * 
  * 
  * 
  * | Function                                                            | Description                                                                                                                                                                                                                                                 |
  * |---------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
  * | [**AddStroke**](/windows/desktop/api/recapis/nf-recapis-addstroke)                                      | Adds an ink stroke to the recognizer context.<br/>                                                                                                                                                                                                    |
  * | [**AdviseInkChange**](/windows/desktop/api/recapis/nf-recapis-adviseinkchange)                          | Stops the recognizer from processing ink because a new stroke is being added or deleted.<br/>                                                                                                                                                         |
  * | [**CloneContext**](/windows/desktop/api/recapis/nf-recapis-clonecontext)                                | Creates a recognizer context that contains the same settings as the original. The new recognizer context does not include the ink or recognition results of the original.<br/>                                                                        |
  * | [**EndInkInput**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-endinkinput)             | Indicates that no more ink will be added to the context.<br/>                                                                                                                                                                                         |
  * | [**GetAlternateList**](/previous-versions/windows/desktop/legacy/ms698163(v=vs.85))                        | Returns a list of alternates for the best result string.<br/>                                                                                                                                                                                         |
  * | [**GetBestAlternate**](/previous-versions/windows/desktop/legacy/ms699575(v=vs.85))                        | Returns an [HRECOALT Handle](hrecoalt-handle.md) pointer for the best result alternate.<br/>                                                                                                                                                         |
  * | [**GetBestResultString**](/windows/desktop/api/recapis/nf-recapis-getbestresultstring)                  | Returns the best result string.<br/>                                                                                                                                                                                                                  |
  * | [**GetContextPropertyList**](/windows/desktop/api/recapis/nf-recapis-getcontextpropertylist)            | Returns a list of properties the recognizer supports.<br/>                                                                                                                                                                                            |
  * | [**GetContextPropertyValue**](/windows/desktop/api/recapis/nf-recapis-getcontextpropertyvalue)          | Returns a specified property value from the recognizer context.<br/>                                                                                                                                                                                  |
  * | [**GetEnabledUnicodeRanges**](/windows/desktop/api/recapis/nf-recapis-getenabledunicoderanges)          | Returns a list of Unicode point ranges enabled on the context.<br/>                                                                                                                                                                                   |
  * | [**GetGuide**](/windows/desktop/api/recapis/nf-recapis-getguide)                                        | Returns the guide used for boxed or lined input.<br/>                                                                                                                                                                                                 |
  * | [**GetLatticePtr**](/windows/desktop/api/recapis/nf-recapis-getlatticeptr)                              | Returns a pointer to the lattice for the current results.<br/>                                                                                                                                                                                        |
  * | [**IsStringSupported**](/windows/desktop/api/msinkaut/nf-msinkaut-iinkrecognizercontext-isstringsupported) | Returns a value that indicates whether a word, date, time, number, or other text that is passed in is contained in the dictionary.<br/>                                                                                                               |
  * | [**Process**](/windows/desktop/api/recapis/nf-recapis-process)                                          | Performs ink recognition synchronously.<br/>                                                                                                                                                                                                          |
  * | [**ResetContext**](/windows/desktop/api/recapis/nf-recapis-resetcontext)                                | Deletes the current ink and recognition results from the context.<br/>                                                                                                                                                                                |
  * | [**SetCACMode**](/windows/desktop/api/recapis/nf-recapis-setcacmode)                                    | Specifies character Autocomplete mode for character or word recognition.<br/>                                                                                                                                                                         |
  * | [**SetContextPropertyValue**](/windows/desktop/api/recapis/nf-recapis-setcontextpropertyvalue)          | Adds a property to the recognizer context. If a property already exists, its value is modified.<br/>                                                                                                                                                  |
  * | [**SetEnabledUnicodeRanges**](/windows/desktop/api/recapis/nf-recapis-setenabledunicoderanges)          | Enables one or more Unicode point ranges on the context.<br/>                                                                                                                                                                                         |
  * | [**SetFactoid**](/windows/desktop/api/recapis/nf-recapis-setfactoid)                                    | Sets the factoid a recognizer uses to constrain its search for the result.<br/>                                                                                                                                                                       |
  * | [**SetFlags**](/windows/desktop/api/recapis/nf-recapis-setflags)                                        | Sets how the recognizer interprets the ink and determines the result string.<br/>                                                                                                                                                                     |
  * | [**SetGuide**](/windows/desktop/api/recapis/nf-recapis-setguide)                                        | Sets the guide to use for boxed or lined input.<br/>                                                                                                                                                                                                  |
  * | [**SetTextContext**](/windows/desktop/api/recapis/nf-recapis-settextcontext)                            | Provides the text strings that come before and after the text contained in the recognizer context. For recognizers of East Asian characters, the [**SetTextContext**](/windows/desktop/api/recapis/nf-recapis-settextcontext) function provides characters rather than text strings.<br/> |
  * | [**SetWordList**](/windows/desktop/api/recapis/nf-recapis-setwordlist)                                  | Sets the word list for the current recognizer context to recognize.<br/>                                                                                                                                                                              |
 * @see https://learn.microsoft.com/windows/win32/tablet/hrecocontext-handle
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class HRECOCONTEXT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
