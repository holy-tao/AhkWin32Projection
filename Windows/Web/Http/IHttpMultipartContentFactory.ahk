#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpMultipartContent.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http
 * @version WindowsRuntime 1.4
 */
class IHttpMultipartContentFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpMultipartContentFactory
     * @type {Guid}
     */
    static IID => Guid("{7eb42e62-0222-4f20-b372-47d5db5d33b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithSubtype", "CreateWithSubtypeAndBoundary"]

    /**
     * 
     * @param {HSTRING} subtype 
     * @returns {HttpMultipartContent} 
     */
    CreateWithSubtype(subtype) {
        if(subtype is String) {
            pin := HSTRING.Create(subtype)
            subtype := pin.Value
        }
        subtype := subtype is Win32Handle ? NumGet(subtype, "ptr") : subtype

        result := ComCall(6, this, "ptr", subtype, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMultipartContent(value)
    }

    /**
     * 
     * @param {HSTRING} subtype 
     * @param {HSTRING} boundary 
     * @returns {HttpMultipartContent} 
     */
    CreateWithSubtypeAndBoundary(subtype, boundary) {
        if(subtype is String) {
            pin := HSTRING.Create(subtype)
            subtype := pin.Value
        }
        subtype := subtype is Win32Handle ? NumGet(subtype, "ptr") : subtype
        if(boundary is String) {
            pin := HSTRING.Create(boundary)
            boundary := pin.Value
        }
        boundary := boundary is Win32Handle ? NumGet(boundary, "ptr") : boundary

        result := ComCall(7, this, "ptr", subtype, "ptr", boundary, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpMultipartContent(value)
    }
}
