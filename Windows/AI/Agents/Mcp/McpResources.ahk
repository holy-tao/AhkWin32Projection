#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMcpResourcesStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.AI.Agents.Mcp
 * @version WindowsRuntime 1.4
 */
class McpResources extends IInspectable {
;@region Static Properties
    /**
     * @type {HSTRING} 
     */
    static FileSystemRead {
        get => McpResources.get_FileSystemRead()
    }

    /**
     * @type {HSTRING} 
     */
    static FileSystemWrite {
        get => McpResources.get_FileSystemWrite()
    }

    /**
     * @type {HSTRING} 
     */
    static FileSystemDelete {
        get => McpResources.get_FileSystemDelete()
    }

    /**
     * @type {HSTRING} 
     */
    static FileSystemCreate {
        get => McpResources.get_FileSystemCreate()
    }

    /**
     * @type {HSTRING} 
     */
    static HttpGet {
        get => McpResources.get_HttpGet()
    }

    /**
     * @type {HSTRING} 
     */
    static HttpPost {
        get => McpResources.get_HttpPost()
    }

    /**
     * @type {HSTRING} 
     */
    static HttpPut {
        get => McpResources.get_HttpPut()
    }

    /**
     * @type {HSTRING} 
     */
    static HttpDelete {
        get => McpResources.get_HttpDelete()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_FileSystemRead() {
        if (!McpResources.HasProp("__IMcpResourcesStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.Agents.Mcp.McpResources")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMcpResourcesStatics.IID)
            McpResources.__IMcpResourcesStatics := IMcpResourcesStatics(factoryPtr)
        }

        return McpResources.__IMcpResourcesStatics.get_FileSystemRead()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_FileSystemWrite() {
        if (!McpResources.HasProp("__IMcpResourcesStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.Agents.Mcp.McpResources")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMcpResourcesStatics.IID)
            McpResources.__IMcpResourcesStatics := IMcpResourcesStatics(factoryPtr)
        }

        return McpResources.__IMcpResourcesStatics.get_FileSystemWrite()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_FileSystemDelete() {
        if (!McpResources.HasProp("__IMcpResourcesStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.Agents.Mcp.McpResources")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMcpResourcesStatics.IID)
            McpResources.__IMcpResourcesStatics := IMcpResourcesStatics(factoryPtr)
        }

        return McpResources.__IMcpResourcesStatics.get_FileSystemDelete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_FileSystemCreate() {
        if (!McpResources.HasProp("__IMcpResourcesStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.Agents.Mcp.McpResources")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMcpResourcesStatics.IID)
            McpResources.__IMcpResourcesStatics := IMcpResourcesStatics(factoryPtr)
        }

        return McpResources.__IMcpResourcesStatics.get_FileSystemCreate()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HttpGet() {
        if (!McpResources.HasProp("__IMcpResourcesStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.Agents.Mcp.McpResources")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMcpResourcesStatics.IID)
            McpResources.__IMcpResourcesStatics := IMcpResourcesStatics(factoryPtr)
        }

        return McpResources.__IMcpResourcesStatics.get_HttpGet()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HttpPost() {
        if (!McpResources.HasProp("__IMcpResourcesStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.Agents.Mcp.McpResources")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMcpResourcesStatics.IID)
            McpResources.__IMcpResourcesStatics := IMcpResourcesStatics(factoryPtr)
        }

        return McpResources.__IMcpResourcesStatics.get_HttpPost()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HttpPut() {
        if (!McpResources.HasProp("__IMcpResourcesStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.Agents.Mcp.McpResources")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMcpResourcesStatics.IID)
            McpResources.__IMcpResourcesStatics := IMcpResourcesStatics(factoryPtr)
        }

        return McpResources.__IMcpResourcesStatics.get_HttpPut()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HttpDelete() {
        if (!McpResources.HasProp("__IMcpResourcesStatics")) {
            activatableClassId := HSTRING.Create("Windows.AI.Agents.Mcp.McpResources")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMcpResourcesStatics.IID)
            McpResources.__IMcpResourcesStatics := IMcpResourcesStatics(factoryPtr)
        }

        return McpResources.__IMcpResourcesStatics.get_HttpDelete()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
