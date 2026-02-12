#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUpdatePluginVersionInfo.ahk
#Include .\IUpdatePluginVersionInfoFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class UpdatePluginVersionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUpdatePluginVersionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUpdatePluginVersionInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} majorVersion 
     * @param {Integer} minorVersion 
     * @param {Integer} patchLevel 
     * @returns {UpdatePluginVersionInfo} 
     */
    static CreateInstance(majorVersion, minorVersion, patchLevel) {
        if (!UpdatePluginVersionInfo.HasProp("__IUpdatePluginVersionInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.Cluster.UpdatePluginVersionInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUpdatePluginVersionInfoFactory.IID)
            UpdatePluginVersionInfo.__IUpdatePluginVersionInfoFactory := IUpdatePluginVersionInfoFactory(factoryPtr)
        }

        return UpdatePluginVersionInfo.__IUpdatePluginVersionInfoFactory.CreateInstance(majorVersion, minorVersion, patchLevel)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    MajorVersion {
        get => this.get_MajorVersion()
    }

    /**
     * @type {Integer} 
     */
    MinorVersion {
        get => this.get_MinorVersion()
    }

    /**
     * @type {Integer} 
     */
    PatchLevel {
        get => this.get_PatchLevel()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MajorVersion() {
        if (!this.HasProp("__IUpdatePluginVersionInfo")) {
            if ((queryResult := this.QueryInterface(IUpdatePluginVersionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdatePluginVersionInfo := IUpdatePluginVersionInfo(outPtr)
        }

        return this.__IUpdatePluginVersionInfo.get_MajorVersion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinorVersion() {
        if (!this.HasProp("__IUpdatePluginVersionInfo")) {
            if ((queryResult := this.QueryInterface(IUpdatePluginVersionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdatePluginVersionInfo := IUpdatePluginVersionInfo(outPtr)
        }

        return this.__IUpdatePluginVersionInfo.get_MinorVersion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PatchLevel() {
        if (!this.HasProp("__IUpdatePluginVersionInfo")) {
            if ((queryResult := this.QueryInterface(IUpdatePluginVersionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUpdatePluginVersionInfo := IUpdatePluginVersionInfo(outPtr)
        }

        return this.__IUpdatePluginVersionInfo.get_PatchLevel()
    }

;@endregion Instance Methods
}
