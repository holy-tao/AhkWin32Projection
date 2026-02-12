#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMcpHttpConnectionResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.AI.Agents.Mcp
 * @version WindowsRuntime 1.4
 */
class McpHttpConnectionResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMcpHttpConnectionResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMcpHttpConnectionResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
        set => this.put_Uri(value)
    }

    /**
     * @type {ValueSet} 
     */
    Headers {
        get => this.get_Headers()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IMcpHttpConnectionResult")) {
            if ((queryResult := this.QueryInterface(IMcpHttpConnectionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpHttpConnectionResult := IMcpHttpConnectionResult(outPtr)
        }

        return this.__IMcpHttpConnectionResult.get_Uri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_Uri(value) {
        if (!this.HasProp("__IMcpHttpConnectionResult")) {
            if ((queryResult := this.QueryInterface(IMcpHttpConnectionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpHttpConnectionResult := IMcpHttpConnectionResult(outPtr)
        }

        return this.__IMcpHttpConnectionResult.put_Uri(value)
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_Headers() {
        if (!this.HasProp("__IMcpHttpConnectionResult")) {
            if ((queryResult := this.QueryInterface(IMcpHttpConnectionResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpHttpConnectionResult := IMcpHttpConnectionResult(outPtr)
        }

        return this.__IMcpHttpConnectionResult.get_Headers()
    }

;@endregion Instance Methods
}
