#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Not implemented.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-ienumtfcontextviews
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IEnumTfContextViews extends IUnknown{
    /**
     * The interface identifier for IEnumTfContextViews
     * @type {Guid}
     */
    static IID => Guid("{f0c0f8dd-cf38-44e1-bb0f-68cf0d551c78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IEnumTfContextViews>} ppEnum 
     * @returns {HRESULT} 
     */
    Clone(ppEnum) {
        result := ComCall(3, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<ITfContextView>} rgViews 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    Next(ulCount, rgViews, pcFetched) {
        result := ComCall(4, this, "uint", ulCount, "ptr", rgViews, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
