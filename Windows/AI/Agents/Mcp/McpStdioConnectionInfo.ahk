#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMcpStdioConnectionInfo.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.AI.Agents.Mcp
 * @version WindowsRuntime 1.4
 */
class McpStdioConnectionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMcpStdioConnectionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMcpStdioConnectionInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    Command {
        get => this.get_Command()
    }

    /**
     * @type {McpServerInfo} 
     */
    Info {
        get => this.get_Info()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Command() {
        if (!this.HasProp("__IMcpStdioConnectionInfo")) {
            if ((queryResult := this.QueryInterface(IMcpStdioConnectionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpStdioConnectionInfo := IMcpStdioConnectionInfo(outPtr)
        }

        return this.__IMcpStdioConnectionInfo.get_Command()
    }

    /**
     * 
     * @param {Pointer<Pointer>} result_ 
     * @returns {HRESULT} 
     */
    GetCommandArguments(result_) {
        if (!this.HasProp("__IMcpStdioConnectionInfo")) {
            if ((queryResult := this.QueryInterface(IMcpStdioConnectionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpStdioConnectionInfo := IMcpStdioConnectionInfo(outPtr)
        }

        return this.__IMcpStdioConnectionInfo.GetCommandArguments(result_)
    }

    /**
     * 
     * @returns {McpServerInfo} 
     */
    get_Info() {
        if (!this.HasProp("__IMcpStdioConnectionInfo")) {
            if ((queryResult := this.QueryInterface(IMcpStdioConnectionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpStdioConnectionInfo := IMcpStdioConnectionInfo(outPtr)
        }

        return this.__IMcpStdioConnectionInfo.get_Info()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
