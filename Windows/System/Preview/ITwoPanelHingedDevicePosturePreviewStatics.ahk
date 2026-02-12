#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\TwoPanelHingedDevicePosturePreview.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Preview
 * @version WindowsRuntime 1.4
 */
class ITwoPanelHingedDevicePosturePreviewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITwoPanelHingedDevicePosturePreviewStatics
     * @type {Guid}
     */
    static IID => Guid("{0c4733d2-57e0-4180-bd5e-f31a2138423e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDefaultAsync"]

    /**
     * 
     * @returns {IAsyncOperation<TwoPanelHingedDevicePosturePreview>} 
     */
    GetDefaultAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(TwoPanelHingedDevicePosturePreview, result_)
    }
}
