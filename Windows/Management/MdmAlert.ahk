#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMdmAlert.ahk
#Include ..\..\Guid.ahk

/**
 * Provides functionality to configure the data sent to the mobile device management server.
 * @remarks
 * There are two uses of MdmAlert:
 * 
 * 1. Before you start an MdmSession: Create an alert and customize the alert parameters.
 * 2. After you start an MdmSession: Query the session for results from the alert, including status sent back by the server for the alert.
 * 
 * Note: The generic alert (1226) is most common.
 * @see https://learn.microsoft.com/uwp/api/windows.management.mdmalert
 * @namespace Windows.Management
 * @version WindowsRuntime 1.4
 */
class MdmAlert extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMdmAlert

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMdmAlert.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Custom MDM data sent to the server.
     * @remarks
     * The [MdmSession](MdmSession.md) can be configured to allow callers to configure zero or more alerts when initiating a session with an MDM server.
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmalert.data
     * @type {HSTRING} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * The data format of the MDM alert.
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmalert.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
        set => this.put_Format(value)
    }

    /**
     * The priority or criticality of the alert.
     * @remarks
     * These values are limited and set by the Open Mobile Alliance (OMA) standard.
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmalert.mark
     * @type {Integer} 
     */
    Mark {
        get => this.get_Mark()
        set => this.put_Mark(value)
    }

    /**
     * The local URI path to the source of the alert.
     * @remarks
     * This is an optional property.
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmalert.source
     * @type {HSTRING} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * A read-only status code sent by the server in response to the alert.
     * @remarks
     * For a complete list of status codes, see the SyncML response status codes table in [OMA DM protocol support](/windows/client-management/mdm/oma-dm-protocol-support).
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmalert.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * The local URI path to the inventory location of the application.
     * @remarks
     * This is an optional property.
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmalert.target
     * @type {HSTRING} 
     */
    Target {
        get => this.get_Target()
        set => this.put_Target(value)
    }

    /**
     * The type of the alert. This is also the alert ID.
     * @remarks
     * This format is mandated by the OMA-DM standard and follows the pattern: "Reversed-Domain-Name:&lt;your-domain-info-here&gt;"
     * 
     * See [MdmAlert](MdmAlert.md) for an example of how to set this property.
     * @see https://learn.microsoft.com/uwp/api/windows.management.mdmalert.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * An MDM alert with custom data fields.
     * @remarks
     * See the example at [MdmAlert](MdmAlert.md) for how to configure an alert.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.MdmAlert")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Data() {
        if (!this.HasProp("__IMdmAlert")) {
            if ((queryResult := this.QueryInterface(IMdmAlert.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmAlert := IMdmAlert(outPtr)
        }

        return this.__IMdmAlert.get_Data()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IMdmAlert")) {
            if ((queryResult := this.QueryInterface(IMdmAlert.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmAlert := IMdmAlert(outPtr)
        }

        return this.__IMdmAlert.put_Data(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        if (!this.HasProp("__IMdmAlert")) {
            if ((queryResult := this.QueryInterface(IMdmAlert.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmAlert := IMdmAlert(outPtr)
        }

        return this.__IMdmAlert.get_Format()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Format(value) {
        if (!this.HasProp("__IMdmAlert")) {
            if ((queryResult := this.QueryInterface(IMdmAlert.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmAlert := IMdmAlert(outPtr)
        }

        return this.__IMdmAlert.put_Format(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mark() {
        if (!this.HasProp("__IMdmAlert")) {
            if ((queryResult := this.QueryInterface(IMdmAlert.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmAlert := IMdmAlert(outPtr)
        }

        return this.__IMdmAlert.get_Mark()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mark(value) {
        if (!this.HasProp("__IMdmAlert")) {
            if ((queryResult := this.QueryInterface(IMdmAlert.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmAlert := IMdmAlert(outPtr)
        }

        return this.__IMdmAlert.put_Mark(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Source() {
        if (!this.HasProp("__IMdmAlert")) {
            if ((queryResult := this.QueryInterface(IMdmAlert.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmAlert := IMdmAlert(outPtr)
        }

        return this.__IMdmAlert.get_Source()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__IMdmAlert")) {
            if ((queryResult := this.QueryInterface(IMdmAlert.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmAlert := IMdmAlert(outPtr)
        }

        return this.__IMdmAlert.put_Source(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IMdmAlert")) {
            if ((queryResult := this.QueryInterface(IMdmAlert.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmAlert := IMdmAlert(outPtr)
        }

        return this.__IMdmAlert.get_Status()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Target() {
        if (!this.HasProp("__IMdmAlert")) {
            if ((queryResult := this.QueryInterface(IMdmAlert.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmAlert := IMdmAlert(outPtr)
        }

        return this.__IMdmAlert.get_Target()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Target(value) {
        if (!this.HasProp("__IMdmAlert")) {
            if ((queryResult := this.QueryInterface(IMdmAlert.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmAlert := IMdmAlert(outPtr)
        }

        return this.__IMdmAlert.put_Target(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Type() {
        if (!this.HasProp("__IMdmAlert")) {
            if ((queryResult := this.QueryInterface(IMdmAlert.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmAlert := IMdmAlert(outPtr)
        }

        return this.__IMdmAlert.get_Type()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Type(value) {
        if (!this.HasProp("__IMdmAlert")) {
            if ((queryResult := this.QueryInterface(IMdmAlert.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMdmAlert := IMdmAlert(outPtr)
        }

        return this.__IMdmAlert.put_Type(value)
    }

;@endregion Instance Methods
}
