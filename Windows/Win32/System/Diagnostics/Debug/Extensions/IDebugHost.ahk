#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHost extends IUnknown{
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
     * 
     * @param {Pointer<IUnknown>} hostUnk 
     * @returns {HRESULT} 
     */
    GetHostDefinedInterface(hostUnk) {
        result := ComCall(3, this, "ptr", hostUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDebugHostContext>} context 
     * @returns {HRESULT} 
     */
    GetCurrentContext(context) {
        result := ComCall(4, this, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IKeyStore>} defaultMetadataStore 
     * @returns {HRESULT} 
     */
    GetDefaultMetadata(defaultMetadataStore) {
        result := ComCall(5, this, "ptr", defaultMetadataStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
