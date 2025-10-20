#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Printing
 * @version v4.0.30319
 */
class IPrintDocumentPageSource extends IUnknown{
    /**
     * The interface identifier for IPrintDocumentPageSource
     * @type {Guid}
     */
    static IID => Guid("{a96bb1db-172e-4667-82b5-ad97a252318f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IPrintDocumentPackageTarget>} docPackageTarget 
     * @param {Pointer<IPrintPreviewPageCollection>} docPageCollection 
     * @returns {HRESULT} 
     */
    GetPreviewPageCollection(docPackageTarget, docPageCollection) {
        result := ComCall(3, this, "ptr", docPackageTarget, "ptr", docPageCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IInspectable>} printTaskOptions 
     * @param {Pointer<IPrintDocumentPackageTarget>} docPackageTarget 
     * @returns {HRESULT} 
     */
    MakeDocument(printTaskOptions, docPackageTarget) {
        result := ComCall(4, this, "ptr", printTaskOptions, "ptr", docPackageTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
