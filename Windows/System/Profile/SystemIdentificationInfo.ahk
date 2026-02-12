#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemIdentificationInfo.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a unique system identifier based on either the app publisher ID or a user ID.
 * @remarks
 * Call the [GetSystemIdForPublisher](systemidentification_getsystemidforpublisher_728928815.md) method or the [GetSystemIdForUser](systemidentification_getsystemidforuser_459524648.md) method to get an instance of this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemidentificationinfo
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class SystemIdentificationInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemIdentificationInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemIdentificationInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a unique system identifier based on either the app publisher ID or a user ID.
     * @remarks
     * This ID is a collection of bytes in a buffer. It is not intended to be interpreted as a string but it can be compared against other buffers.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemidentificationinfo.id
     * @type {IBuffer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the source that generated the unique ID, either a Unified Extensible Firmware Interface (UEFI) or a Trusted Platform Module (TPM).
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.systemidentificationinfo.source
     * @type {Integer} 
     */
    Source {
        get => this.get_Source()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Id() {
        if (!this.HasProp("__ISystemIdentificationInfo")) {
            if ((queryResult := this.QueryInterface(ISystemIdentificationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemIdentificationInfo := ISystemIdentificationInfo(outPtr)
        }

        return this.__ISystemIdentificationInfo.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Source() {
        if (!this.HasProp("__ISystemIdentificationInfo")) {
            if ((queryResult := this.QueryInterface(ISystemIdentificationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemIdentificationInfo := ISystemIdentificationInfo(outPtr)
        }

        return this.__ISystemIdentificationInfo.get_Source()
    }

;@endregion Instance Methods
}
