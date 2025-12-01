#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\Apis.ahk
#Include ..\..\..\..\Win32Handle.ahk

/**
 * An HRECOGNIZER handle is used to create a recognizer context, retrieve the recognizer's attributes and properties, and determine which packet properties the recognizer requires to perform recognition.
 * @remarks
 * The following functions use an **HRECOGNIZER**.
 * 
 * 
 * 
 * | Function                                                               | Description                                                                                        |
 * |------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
 * | [**CreateRecognizer**](/windows/desktop/api/recapis/nf-recapis-createrecognizer)                           | Creates a recognizer.<br/>                                                                   |
 * | [**DestroyRecognizer**](/windows/desktop/api/recapis/nf-recapis-destroyrecognizer)                         | Destroys a recognizer.<br/>                                                                  |
 * | [**GetRecoAttributes**](/windows/desktop/api/recapis/nf-recapis-getrecoattributes)                         | Returns the attributes of the recognizer.<br/>                                               |
 * | [**CreateContext**](/windows/desktop/api/recapis/nf-recapis-createcontext)                                 | Creates a recognizer context.<br/>                                                           |
 * | [**DestroyContext**](/windows/desktop/api/recapis/nf-recapis-destroycontext)                               | Destroys a recognizer context.<br/>                                                          |
 * | [**GetAllRecognizers**](/windows/desktop/api/recapis/nf-recapis-getallrecognizers)                         | Gets all recognizers.<br/>                                                                   |
 * | [**GetResultPropertyList**](/windows/desktop/api/recapis/nf-recapis-getresultpropertylist)                 | Retrieves a list of properties the recognizer can return for a result range.<br/>            |
 * | [**GetPreferredPacketDescription**](/windows/desktop/api/recapis/nf-recapis-getpreferredpacketdescription) | Retrieves a packet description that contains the packet properties the recognizer uses.<br/> |
 * | [**GetUnicodeRanges**](/windows/desktop/api/recapis/nf-recapis-getunicoderanges)                           | Retrieves the ranges of Unicode points that the recognizer supports.<br/>                    |
 * | [**LoadCachedAttributes**](/windows/desktop/api/recapis/nf-recapis-loadcachedattributes)                   | Loads the cached attributes of a recognizer.<br/>                                            |
 * @see https://learn.microsoft.com/windows/win32/tablet/hrecognizer-handle
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class HRECOGNIZER extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => [-1, 0]

    /**
     * @type {Pointer<Void>}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    Free(){
        TabletPC.DestroyRecognizer(this.Value)
        this.Value := -1
    }
}
