#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class ICatalogFileInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICatalogFileInfo
     * @type {Guid}
     */
    static IID => Guid("{711c7600-6b48-11d1-b403-00aa00b92af1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCatalogFile", "GetJavaTrust"]

    /**
     * 
     * @returns {PSTR} 
     */
    GetCatalogFile() {
        result := ComCall(3, this, "ptr*", &ppszCatalogFile := 0, "HRESULT")
        return ppszCatalogFile
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    GetJavaTrust() {
        result := ComCall(4, this, "ptr*", &ppJavaTrust := 0, "HRESULT")
        return ppJavaTrust
    }
}
