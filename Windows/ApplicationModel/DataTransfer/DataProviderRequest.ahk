#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDataProviderRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * An object of this type is passed to the [DataProviderHandler](dataproviderhandler.md) delegate.
 * @remarks
 * Use this object when you need to delay, or defer, a share for a few milliseconds. To learn more, check out [How to delay sharing](/previous-versions/windows/apps/hh770847(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dataproviderrequest
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class DataProviderRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDataProviderRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDataProviderRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies the format id.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dataproviderrequest.formatid
     * @type {HSTRING} 
     */
    FormatId {
        get => this.get_FormatId()
    }

    /**
     * Gets the deadline for finishing a delayed rendering operation. If execution goes beyond that deadline, the results of delayed rendering are ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dataproviderrequest.deadline
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
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
    get_FormatId() {
        if (!this.HasProp("__IDataProviderRequest")) {
            if ((queryResult := this.QueryInterface(IDataProviderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataProviderRequest := IDataProviderRequest(outPtr)
        }

        return this.__IDataProviderRequest.get_FormatId()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        if (!this.HasProp("__IDataProviderRequest")) {
            if ((queryResult := this.QueryInterface(IDataProviderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataProviderRequest := IDataProviderRequest(outPtr)
        }

        return this.__IDataProviderRequest.get_Deadline()
    }

    /**
     * Returns a [DataProviderDeferral](dataproviderdeferral.md) object.
     * @remarks
     * To learn more, check out [How to produce requested data asynchronously](/previous-versions/windows/apps/hh770847(v=win.10)).
     * @returns {DataProviderDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dataproviderrequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IDataProviderRequest")) {
            if ((queryResult := this.QueryInterface(IDataProviderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataProviderRequest := IDataProviderRequest(outPtr)
        }

        return this.__IDataProviderRequest.GetDeferral()
    }

    /**
     * Sets the content of the [DataPackage](datapackage.md) to be shared with a target app.
     * @param {IInspectable} value The object associated with a particular format in the [DataPackage](datapackage.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.dataproviderrequest.setdata
     */
    SetData(value) {
        if (!this.HasProp("__IDataProviderRequest")) {
            if ((queryResult := this.QueryInterface(IDataProviderRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDataProviderRequest := IDataProviderRequest(outPtr)
        }

        return this.__IDataProviderRequest.SetData(value)
    }

;@endregion Instance Methods
}
