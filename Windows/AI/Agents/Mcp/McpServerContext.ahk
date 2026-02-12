#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMcpServerContext.ahk
#Include .\IMcpServerContextStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.AI.Agents.Mcp
 * @version WindowsRuntime 1.4
 */
class McpServerContext extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMcpServerContext

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMcpServerContext.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {McpServerContext} 
     */
    static GetContextForCaller() {
        if (!McpServerContext.HasProp("__IMcpServerContextStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.Agents.Mcp.McpServerContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMcpServerContextStatics.IID)
            McpServerContext.__IMcpServerContextStatics := IMcpServerContextStatics(factoryPtr)
        }

        return McpServerContext.__IMcpServerContextStatics.GetContextForCaller()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    AppId {
        get => this.get_AppId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppId() {
        if (!this.HasProp("__IMcpServerContext")) {
            if ((queryResult := this.QueryInterface(IMcpServerContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpServerContext := IMcpServerContext(outPtr)
        }

        return this.__IMcpServerContext.get_AppId()
    }

    /**
     * 
     * @param {Uri} resource 
     * @param {HSTRING} description 
     * @param {HSTRING} reasonForAsking 
     * @returns {Integer} 
     */
    RequestResourceAccess(resource, description, reasonForAsking) {
        if (!this.HasProp("__IMcpServerContext")) {
            if ((queryResult := this.QueryInterface(IMcpServerContext.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpServerContext := IMcpServerContext(outPtr)
        }

        return this.__IMcpServerContext.RequestResourceAccess(resource, description, reasonForAsking)
    }

;@endregion Instance Methods
}
