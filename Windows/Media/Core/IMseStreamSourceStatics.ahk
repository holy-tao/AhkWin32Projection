#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMseStreamSourceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMseStreamSourceStatics
     * @type {Guid}
     */
    static IID => Guid("{465c679d-d570-43ce-ba21-0bff5f3fbd0a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsContentTypeSupported"]

    /**
     * 
     * @param {HSTRING} contentType 
     * @returns {Boolean} 
     */
    IsContentTypeSupported(contentType) {
        if(contentType is String) {
            pin := HSTRING.Create(contentType)
            contentType := pin.Value
        }
        contentType := contentType is Win32Handle ? NumGet(contentType, "ptr") : contentType

        result := ComCall(6, this, "ptr", contentType, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
