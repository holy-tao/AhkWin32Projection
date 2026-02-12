#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\Uri.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IUriRuntimeClassFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUriRuntimeClassFactory
     * @type {Guid}
     */
    static IID => Guid("{44a9796f-723e-4fdf-a218-033e75b0c084}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateUri", "CreateWithRelativeUri"]

    /**
     * 
     * @param {HSTRING} uri_ 
     * @returns {Uri} 
     */
    CreateUri(uri_) {
        if(uri_ is String) {
            pin := HSTRING.Create(uri_)
            uri_ := pin.Value
        }
        uri_ := uri_ is Win32Handle ? NumGet(uri_, "ptr") : uri_

        result := ComCall(6, this, "ptr", uri_, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(instance)
    }

    /**
     * 
     * @param {HSTRING} baseUri 
     * @param {HSTRING} relativeUri 
     * @returns {Uri} 
     */
    CreateWithRelativeUri(baseUri, relativeUri) {
        if(baseUri is String) {
            pin := HSTRING.Create(baseUri)
            baseUri := pin.Value
        }
        baseUri := baseUri is Win32Handle ? NumGet(baseUri, "ptr") : baseUri
        if(relativeUri is String) {
            pin := HSTRING.Create(relativeUri)
            relativeUri := pin.Value
        }
        relativeUri := relativeUri is Win32Handle ? NumGet(relativeUri, "ptr") : relativeUri

        result := ComCall(7, this, "ptr", baseUri, "ptr", relativeUri, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(instance)
    }
}
