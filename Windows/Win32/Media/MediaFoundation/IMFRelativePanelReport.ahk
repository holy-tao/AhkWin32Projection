#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is used to retrieve the current relative panel location for a display region.
 * @remarks
 * 
  * Use the methods of the [IMFRelativePanelWatcher](nn-mfidl-imfrelativepanelwatcher.md) interface to get an instance of this interface.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfrelativepanelreport
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFRelativePanelReport extends IUnknown{
    /**
     * The interface identifier for IMFRelativePanelReport
     * @type {Guid}
     */
    static IID => Guid("{f25362ea-2c0e-447f-81e2-755914cdc0c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} panel 
     * @returns {HRESULT} 
     */
    GetRelativePanel(panel) {
        result := ComCall(3, this, "uint*", panel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
