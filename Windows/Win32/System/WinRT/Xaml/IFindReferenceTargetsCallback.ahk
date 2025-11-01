#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nn-windows-ui-xaml-hosting-referencetracker-ifindreferencetargetscallback
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IFindReferenceTargetsCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFindReferenceTargetsCallback
     * @type {Guid}
     */
    static IID => Guid("{04b3486c-4687-4229-8d14-505ab584dd88}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FoundTrackerTarget"]

    /**
     * 
     * @param {IReferenceTrackerTarget} target 
     * @returns {HRESULT} 
     */
    FoundTrackerTarget(target) {
        result := ComCall(3, this, "ptr", target, "HRESULT")
        return result
    }
}
