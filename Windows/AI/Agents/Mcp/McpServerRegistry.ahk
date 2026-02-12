#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMcpServerRegistry.ahk
#Include .\IMcpServerRegistryStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.AI.Agents.Mcp
 * @version WindowsRuntime 1.4
 */
class McpServerRegistry extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMcpServerRegistry

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMcpServerRegistry.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {McpServerRegistry} 
     */
    static GetDefault() {
        if (!McpServerRegistry.HasProp("__IMcpServerRegistryStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.Agents.Mcp.McpServerRegistry")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMcpServerRegistryStatics.IID)
            McpServerRegistry.__IMcpServerRegistryStatics := IMcpServerRegistryStatics(factoryPtr)
        }

        return McpServerRegistry.__IMcpServerRegistryStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetMcpServerInfos(result_) {
        if (!this.HasProp("__IMcpServerRegistry")) {
            if ((queryResult := this.QueryInterface(IMcpServerRegistry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpServerRegistry := IMcpServerRegistry(outPtr)
        }

        return this.__IMcpServerRegistry.GetMcpServerInfos(result_)
    }

    /**
     * 
     * @param {Guid} mcpServerId 
     * @param {WindowId} ownerWindowId 
     * @returns {McpStdioConnectionInfo} 
     */
    GetMcpConnectionInfo(mcpServerId, ownerWindowId) {
        if (!this.HasProp("__IMcpServerRegistry")) {
            if ((queryResult := this.QueryInterface(IMcpServerRegistry.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpServerRegistry := IMcpServerRegistry(outPtr)
        }

        return this.__IMcpServerRegistry.GetMcpConnectionInfo(mcpServerId, ownerWindowId)
    }

;@endregion Instance Methods
}
