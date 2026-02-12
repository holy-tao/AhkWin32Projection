#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HttpProductHeaderValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Headers
 * @version WindowsRuntime 1.4
 */
class IHttpProductHeaderValueFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpProductHeaderValueFactory
     * @type {Guid}
     */
    static IID => Guid("{611aa4f5-82bc-42fb-977b-dc00536e5e86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateFromName", "CreateFromNameWithVersion"]

    /**
     * 
     * @param {HSTRING} productName 
     * @returns {HttpProductHeaderValue} 
     */
    CreateFromName(productName) {
        if(productName is String) {
            pin := HSTRING.Create(productName)
            productName := pin.Value
        }
        productName := productName is Win32Handle ? NumGet(productName, "ptr") : productName

        result := ComCall(6, this, "ptr", productName, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpProductHeaderValue(value)
    }

    /**
     * 
     * @param {HSTRING} productName 
     * @param {HSTRING} productVersion 
     * @returns {HttpProductHeaderValue} 
     */
    CreateFromNameWithVersion(productName, productVersion) {
        if(productName is String) {
            pin := HSTRING.Create(productName)
            productName := pin.Value
        }
        productName := productName is Win32Handle ? NumGet(productName, "ptr") : productName
        if(productVersion is String) {
            pin := HSTRING.Create(productVersion)
            productVersion := pin.Value
        }
        productVersion := productVersion is Win32Handle ? NumGet(productVersion, "ptr") : productVersion

        result := ComCall(7, this, "ptr", productName, "ptr", productVersion, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpProductHeaderValue(value)
    }
}
