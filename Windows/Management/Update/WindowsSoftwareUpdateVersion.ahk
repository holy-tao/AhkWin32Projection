#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateVersion.ahk
#Include .\IWindowsSoftwareUpdateVersionFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateVersion extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateVersion

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateVersion.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} major 
     * @param {Integer} minor 
     * @param {Integer} revisionMajor 
     * @param {Integer} revisionMinor 
     * @returns {WindowsSoftwareUpdateVersion} 
     */
    static CreateInstance(major, minor, revisionMajor, revisionMinor) {
        if (!WindowsSoftwareUpdateVersion.HasProp("__IWindowsSoftwareUpdateVersionFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateVersion")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateVersionFactory.IID)
            WindowsSoftwareUpdateVersion.__IWindowsSoftwareUpdateVersionFactory := IWindowsSoftwareUpdateVersionFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateVersion.__IWindowsSoftwareUpdateVersionFactory.CreateInstance(major, minor, revisionMajor, revisionMinor)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    Major {
        get => this.get_Major()
    }

    /**
     * @type {Integer} 
     */
    Minor {
        get => this.get_Minor()
    }

    /**
     * @type {Integer} 
     */
    RevisionMajor {
        get => this.get_RevisionMajor()
    }

    /**
     * @type {Integer} 
     */
    RevisionMinor {
        get => this.get_RevisionMinor()
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
    get_Major() {
        if (!this.HasProp("__IWindowsSoftwareUpdateVersion")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateVersion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateVersion := IWindowsSoftwareUpdateVersion(outPtr)
        }

        return this.__IWindowsSoftwareUpdateVersion.get_Major()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Minor() {
        if (!this.HasProp("__IWindowsSoftwareUpdateVersion")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateVersion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateVersion := IWindowsSoftwareUpdateVersion(outPtr)
        }

        return this.__IWindowsSoftwareUpdateVersion.get_Minor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RevisionMajor() {
        if (!this.HasProp("__IWindowsSoftwareUpdateVersion")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateVersion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateVersion := IWindowsSoftwareUpdateVersion(outPtr)
        }

        return this.__IWindowsSoftwareUpdateVersion.get_RevisionMajor()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RevisionMinor() {
        if (!this.HasProp("__IWindowsSoftwareUpdateVersion")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateVersion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateVersion := IWindowsSoftwareUpdateVersion(outPtr)
        }

        return this.__IWindowsSoftwareUpdateVersion.get_RevisionMinor()
    }

;@endregion Instance Methods
}
