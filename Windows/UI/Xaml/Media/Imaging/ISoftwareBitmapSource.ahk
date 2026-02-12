#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\IAsyncAction.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class ISoftwareBitmapSource extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISoftwareBitmapSource
     * @type {Guid}
     */
    static IID => Guid("{d2dd9ed0-d3c5-4056-91b5-b7c1d1e8130e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBitmapAsync"]

    /**
     * 
     * @param {SoftwareBitmap} softwareBitmap_ 
     * @returns {IAsyncAction} 
     */
    SetBitmapAsync(softwareBitmap_) {
        result := ComCall(6, this, "ptr", softwareBitmap_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
