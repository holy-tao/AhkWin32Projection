#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for retrieving information about the source application.
 * @remarks
 * 
  * <h3><a id="When_to_implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to implement</h3>
  * --&gt;
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ilaunchsourceviewsizepreference
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ILaunchSourceViewSizePreference extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILaunchSourceViewSizePreference
     * @type {Guid}
     */
    static IID => Guid("{e5aa01f7-1fb8-4830-8720-4e6734cbd5f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSourceViewToPosition", "GetSourceViewSizePreference"]

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ilaunchsourceviewsizepreference-getsourceviewtoposition
     */
    GetSourceViewToPosition(hwnd) {
        result := ComCall(3, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} sourceSizeAfterLaunch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ilaunchsourceviewsizepreference-getsourceviewsizepreference
     */
    GetSourceViewSizePreference(sourceSizeAfterLaunch) {
        sourceSizeAfterLaunchMarshal := sourceSizeAfterLaunch is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, sourceSizeAfterLaunchMarshal, sourceSizeAfterLaunch, "HRESULT")
        return result
    }
}
