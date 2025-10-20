#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAVIEditStream interface supports manipulating and modifying editable streams. Uses IUnknown::QueryInterface, IUnknown::AddRef, IUnknown::Release in addition to the following custom methods:\_
 * @see https://docs.microsoft.com/windows/win32/api//vfw/nn-vfw-iavieditstream
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class IAVIEditStream extends IUnknown{
    /**
     * The interface identifier for IAVIEditStream
     * @type {Guid}
     */
    static IID => Guid("{00020024-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} plStart 
     * @param {Pointer<Int32>} plLength 
     * @param {Pointer<IAVIStream>} ppResult 
     * @returns {HRESULT} 
     */
    Cut(plStart, plLength, ppResult) {
        result := ComCall(3, this, "int*", plStart, "int*", plLength, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plStart 
     * @param {Pointer<Int32>} plLength 
     * @param {Pointer<IAVIStream>} ppResult 
     * @returns {HRESULT} 
     */
    Copy(plStart, plLength, ppResult) {
        result := ComCall(4, this, "int*", plStart, "int*", plLength, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plPos 
     * @param {Pointer<Int32>} plLength 
     * @param {Pointer<IAVIStream>} pstream 
     * @param {Integer} lStart 
     * @param {Integer} lEnd 
     * @returns {HRESULT} 
     */
    Paste(plPos, plLength, pstream, lStart, lEnd) {
        result := ComCall(5, this, "int*", plPos, "int*", plLength, "ptr", pstream, "int", lStart, "int", lEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAVIStream>} ppResult 
     * @returns {HRESULT} 
     */
    Clone(ppResult) {
        result := ComCall(6, this, "ptr", ppResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} lpInfo 
     * @param {Integer} cbInfo 
     * @returns {HRESULT} 
     */
    SetInfo(lpInfo, cbInfo) {
        result := ComCall(7, this, "ptr", lpInfo, "int", cbInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
