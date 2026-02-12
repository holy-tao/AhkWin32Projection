#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintSupportPrintDeviceCapabilitiesUpdatePolicy.ahk
#Include .\IPrintSupportPrintDeviceCapabilitiesUpdatePolicyStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides APIs for setting the periodic update policy for the Print Device Capabilities (PDC) based on elapsed time or a specified number of print jobs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprintdevicecapabilitiesupdatepolicy
 * @namespace Windows.Graphics.Printing.PrintSupport
 * @version WindowsRuntime 1.4
 */
class PrintSupportPrintDeviceCapabilitiesUpdatePolicy extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintSupportPrintDeviceCapabilitiesUpdatePolicy

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintSupportPrintDeviceCapabilitiesUpdatePolicy.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Sets the periodic update policy for the Print Device Capabilities (PDC) based on a time interval.
     * @param {TimeSpan} updatePeriod The time interval on which the PDC should be updated.
     * @returns {PrintSupportPrintDeviceCapabilitiesUpdatePolicy} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprintdevicecapabilitiesupdatepolicy.createperiodicrefresh
     */
    static CreatePeriodicRefresh(updatePeriod) {
        if (!PrintSupportPrintDeviceCapabilitiesUpdatePolicy.HasProp("__IPrintSupportPrintDeviceCapabilitiesUpdatePolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.PrintSupport.PrintSupportPrintDeviceCapabilitiesUpdatePolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrintSupportPrintDeviceCapabilitiesUpdatePolicyStatics.IID)
            PrintSupportPrintDeviceCapabilitiesUpdatePolicy.__IPrintSupportPrintDeviceCapabilitiesUpdatePolicyStatics := IPrintSupportPrintDeviceCapabilitiesUpdatePolicyStatics(factoryPtr)
        }

        return PrintSupportPrintDeviceCapabilitiesUpdatePolicy.__IPrintSupportPrintDeviceCapabilitiesUpdatePolicyStatics.CreatePeriodicRefresh(updatePeriod)
    }

    /**
     * Sets the periodic update policy for the Print Device Capabilities (PDC) based on the specified number of print jobs.
     * @param {Integer} numberOfJobs The number of print jobs after which the PDC should be updated.
     * @returns {PrintSupportPrintDeviceCapabilitiesUpdatePolicy} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing.printsupport.printsupportprintdevicecapabilitiesupdatepolicy.createprintjobrefresh
     */
    static CreatePrintJobRefresh(numberOfJobs) {
        if (!PrintSupportPrintDeviceCapabilitiesUpdatePolicy.HasProp("__IPrintSupportPrintDeviceCapabilitiesUpdatePolicyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing.PrintSupport.PrintSupportPrintDeviceCapabilitiesUpdatePolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrintSupportPrintDeviceCapabilitiesUpdatePolicyStatics.IID)
            PrintSupportPrintDeviceCapabilitiesUpdatePolicy.__IPrintSupportPrintDeviceCapabilitiesUpdatePolicyStatics := IPrintSupportPrintDeviceCapabilitiesUpdatePolicyStatics(factoryPtr)
        }

        return PrintSupportPrintDeviceCapabilitiesUpdatePolicy.__IPrintSupportPrintDeviceCapabilitiesUpdatePolicyStatics.CreatePrintJobRefresh(numberOfJobs)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
