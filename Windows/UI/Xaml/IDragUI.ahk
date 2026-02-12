#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class IDragUI extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDragUI
     * @type {Guid}
     */
    static IID => Guid("{2d9bd838-7c60-4842-9170-346fe10a226a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetContentFromBitmapImage", "SetContentFromBitmapImageWithAnchorPoint", "SetContentFromSoftwareBitmap", "SetContentFromSoftwareBitmapWithAnchorPoint", "SetContentFromDataPackage"]

    /**
     * 
     * @param {BitmapImage} bitmapImage_ 
     * @returns {HRESULT} 
     */
    SetContentFromBitmapImage(bitmapImage_) {
        result := ComCall(6, this, "ptr", bitmapImage_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BitmapImage} bitmapImage_ 
     * @param {POINT} anchorPoint 
     * @returns {HRESULT} 
     */
    SetContentFromBitmapImageWithAnchorPoint(bitmapImage_, anchorPoint) {
        result := ComCall(7, this, "ptr", bitmapImage_, "ptr", anchorPoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SoftwareBitmap} softwareBitmap_ 
     * @returns {HRESULT} 
     */
    SetContentFromSoftwareBitmap(softwareBitmap_) {
        result := ComCall(8, this, "ptr", softwareBitmap_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SoftwareBitmap} softwareBitmap_ 
     * @param {POINT} anchorPoint 
     * @returns {HRESULT} 
     */
    SetContentFromSoftwareBitmapWithAnchorPoint(softwareBitmap_, anchorPoint) {
        result := ComCall(9, this, "ptr", softwareBitmap_, "ptr", anchorPoint, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetContentFromDataPackage() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
