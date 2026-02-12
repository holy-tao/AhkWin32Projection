#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IShareProviderOperation.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class represents a share provider operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareprovideroperation
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class ShareProviderOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IShareProviderOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IShareProviderOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the data of the operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareprovideroperation.data
     * @type {DataPackageView} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * Gets the share provider.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareprovideroperation.provider
     * @type {ShareProvider} 
     */
    Provider {
        get => this.get_Provider()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DataPackageView} 
     */
    get_Data() {
        if (!this.HasProp("__IShareProviderOperation")) {
            if ((queryResult := this.QueryInterface(IShareProviderOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareProviderOperation := IShareProviderOperation(outPtr)
        }

        return this.__IShareProviderOperation.get_Data()
    }

    /**
     * 
     * @returns {ShareProvider} 
     */
    get_Provider() {
        if (!this.HasProp("__IShareProviderOperation")) {
            if ((queryResult := this.QueryInterface(IShareProviderOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareProviderOperation := IShareProviderOperation(outPtr)
        }

        return this.__IShareProviderOperation.get_Provider()
    }

    /**
     * Completes the report.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareprovideroperation.reportcompleted
     */
    ReportCompleted() {
        if (!this.HasProp("__IShareProviderOperation")) {
            if ((queryResult := this.QueryInterface(IShareProviderOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareProviderOperation := IShareProviderOperation(outPtr)
        }

        return this.__IShareProviderOperation.ReportCompleted()
    }

;@endregion Instance Methods
}
