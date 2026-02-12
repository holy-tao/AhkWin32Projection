#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMcpServerInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.AI.Agents.Mcp
 * @version WindowsRuntime 1.4
 */
class McpServerInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMcpServerInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMcpServerInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {HSTRING} 
     */
    AppUserModelId {
        get => this.get_AppUserModelId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Id() {
        if (!this.HasProp("__IMcpServerInfo")) {
            if ((queryResult := this.QueryInterface(IMcpServerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpServerInfo := IMcpServerInfo(outPtr)
        }

        return this.__IMcpServerInfo.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IMcpServerInfo")) {
            if ((queryResult := this.QueryInterface(IMcpServerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpServerInfo := IMcpServerInfo(outPtr)
        }

        return this.__IMcpServerInfo.get_Name()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IMcpServerInfo")) {
            if ((queryResult := this.QueryInterface(IMcpServerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpServerInfo := IMcpServerInfo(outPtr)
        }

        return this.__IMcpServerInfo.get_Description()
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        if (!this.HasProp("__IMcpServerInfo")) {
            if ((queryResult := this.QueryInterface(IMcpServerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpServerInfo := IMcpServerInfo(outPtr)
        }

        return this.__IMcpServerInfo.get_Package()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IMcpServerInfo")) {
            if ((queryResult := this.QueryInterface(IMcpServerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpServerInfo := IMcpServerInfo(outPtr)
        }

        return this.__IMcpServerInfo.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppUserModelId() {
        if (!this.HasProp("__IMcpServerInfo")) {
            if ((queryResult := this.QueryInterface(IMcpServerInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMcpServerInfo := IMcpServerInfo(outPtr)
        }

        return this.__IMcpServerInfo.get_AppUserModelId()
    }

;@endregion Instance Methods
}
