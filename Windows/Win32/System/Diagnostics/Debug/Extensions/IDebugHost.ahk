#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk
#Include .\IDebugHostContext.ahk
#Include .\IKeyStore.ahk

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
     * @returns {IUnknown} 
     */
    GetHostDefinedInterface() {
        result := ComCall(3, this, "ptr*", &hostUnk := 0, "HRESULT")
        return IUnknown(hostUnk)
    }

    /**
     * 
     * @returns {IDebugHostContext} 
     */
    GetCurrentContext() {
        result := ComCall(4, this, "ptr*", &context := 0, "HRESULT")
        return IDebugHostContext(context)
    }

    /**
     * 
     * @returns {IKeyStore} 
     */
    GetDefaultMetadata() {
        result := ComCall(5, this, "ptr*", &defaultMetadataStore := 0, "HRESULT")
        return IKeyStore(defaultMetadataStore)
    }
}
