#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to retrieve information about a single continuous range of sectors on the media. This interface is typically used together with the IBlockRangeList interface to describe a collection of sector ranges.
 * @remarks
 * 
  * The values returned by the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iblockrange-get_startlba">IBlockRange::get_StartLba</a> and <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-iblockrange-get_endlba">IBlockRange::get_EndLba</a> methods define an inclusive range, i.e. both the start and end sectors belong to the range.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-iblockrange
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IBlockRange extends IDispatch{
    /**
     * The interface identifier for IBlockRange
     * @type {Guid}
     */
    static IID => Guid("{b507ca25-2204-11dd-966a-001aa01bbc58}")

    /**
     * The class identifier for BlockRange
     * @type {Guid}
     */
    static CLSID => Guid("{b507ca27-2204-11dd-966a-001aa01bbc58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_StartLba(value) {
        result := ComCall(7, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} value 
     * @returns {HRESULT} 
     */
    get_EndLba(value) {
        result := ComCall(8, this, "int*", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
