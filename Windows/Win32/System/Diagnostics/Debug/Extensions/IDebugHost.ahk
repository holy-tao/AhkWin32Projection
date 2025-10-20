#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHost extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHost
     * @type {Guid}
     */
    static IID => Guid("{b8c74943-6b2c-4eeb-b5c5-35d378a6d99d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHostDefinedInterface", "GetCurrentContext", "GetDefaultMetadata"]

    /**
     * 
     * @param {Pointer<IUnknown>} hostUnk 
     * @returns {HRESULT} 
     */
    GetHostDefinedInterface(hostUnk) {
        result := ComCall(3, this, "ptr*", hostUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @returns {HRESULT} 
     */
    GetCurrentContext(context) {
        result := ComCall(4, this, "ptr*", context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IKeyStore>} defaultMetadataStore 
     * @returns {HRESULT} 
     */
    GetDefaultMetadata(defaultMetadataStore) {
        result := ComCall(5, this, "ptr*", defaultMetadataStore, "HRESULT")
        return result
    }
}
