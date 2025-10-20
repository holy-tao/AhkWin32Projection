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
     * 
     * @param {Pointer<HWND>} hwnd 
     * @returns {HRESULT} 
     */
    GetSourceViewToPosition(hwnd) {
        result := ComCall(3, this, "ptr", hwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} sourceSizeAfterLaunch 
     * @returns {HRESULT} 
     */
    GetSourceViewSizePreference(sourceSizeAfterLaunch) {
        result := ComCall(4, this, "int*", sourceSizeAfterLaunch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
