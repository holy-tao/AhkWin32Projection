#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpMultipartFormDataContent.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpMultipartFormDataContentFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpMultipartFormDataContentFactory
     * @type {Guid}
     */
    static IID => Guid("{a04d7311-5017-4622-93a8-49b24a4fcbfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithBoundary"]

    /**
     * 
     * @param {HSTRING} boundary 
     * @returns {HttpMultipartFormDataContent} 
     */
    CreateWithBoundary(boundary) {
        if(boundary is String) {
            pin := HSTRING.Create(boundary)
            boundary := pin.Value
        }
        boundary := boundary is Win32Handle ? NumGet(boundary, "ptr") : boundary

        result := ComCall(6, this, "ptr", boundary, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMultipartFormDataContent(value)
    }
}
