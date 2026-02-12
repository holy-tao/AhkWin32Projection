#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateProviderPayloadFileInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateProviderPayloadFileInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateProviderPayloadFileInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateProviderPayloadFileInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    Filename {
        get => this.get_Filename()
    }

    /**
     * @type {HSTRING} 
     */
    FileHash {
        get => this.get_FileHash()
    }

    /**
     * @type {HSTRING} 
     */
    CatalogFile {
        get => this.get_CatalogFile()
    }

    /**
     * @type {Integer} 
     */
    TrustState {
        get => this.get_TrustState()
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
    get_Filename() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProviderPayloadFileInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProviderPayloadFileInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProviderPayloadFileInfo := IWindowsSoftwareUpdateProviderPayloadFileInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProviderPayloadFileInfo.get_Filename()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FileHash() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProviderPayloadFileInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProviderPayloadFileInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProviderPayloadFileInfo := IWindowsSoftwareUpdateProviderPayloadFileInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProviderPayloadFileInfo.get_FileHash()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CatalogFile() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProviderPayloadFileInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProviderPayloadFileInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProviderPayloadFileInfo := IWindowsSoftwareUpdateProviderPayloadFileInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProviderPayloadFileInfo.get_CatalogFile()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TrustState() {
        if (!this.HasProp("__IWindowsSoftwareUpdateProviderPayloadFileInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateProviderPayloadFileInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateProviderPayloadFileInfo := IWindowsSoftwareUpdateProviderPayloadFileInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateProviderPayloadFileInfo.get_TrustState()
    }

;@endregion Instance Methods
}
