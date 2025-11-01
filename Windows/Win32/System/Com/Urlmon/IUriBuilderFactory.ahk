#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IUriBuilderFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUriBuilderFactory
     * @type {Guid}
     */
    static IID => Guid("{e982ce48-0b96-440c-bc37-0c869b27a29e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateIUriBuilder", "CreateInitializedIUriBuilder"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer} dwReserved 
     * @param {Pointer<IUriBuilder>} ppIUriBuilder 
     * @returns {HRESULT} 
     */
    CreateIUriBuilder(dwFlags, dwReserved, ppIUriBuilder) {
        result := ComCall(3, this, "uint", dwFlags, "ptr", dwReserved, "ptr*", ppIUriBuilder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer} dwReserved 
     * @param {Pointer<IUriBuilder>} ppIUriBuilder 
     * @returns {HRESULT} 
     */
    CreateInitializedIUriBuilder(dwFlags, dwReserved, ppIUriBuilder) {
        result := ComCall(4, this, "uint", dwFlags, "ptr", dwReserved, "ptr*", ppIUriBuilder, "HRESULT")
        return result
    }
}
