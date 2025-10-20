#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPClosedCaption.ahk

/**
 * The IWMPClosedCaption2 interface provides closed captioning methods that supplement the IWMPClosedCaption interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpclosedcaption2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPClosedCaption2 extends IWMPClosedCaption{
    /**
     * The interface identifier for IWMPClosedCaption2
     * @type {Guid}
     */
    static IID => Guid("{350ba78b-6bc8-4113-a5f5-312056934eb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_SAMILangCount(plCount) {
        result := ComCall(15, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    getSAMILangName(nIndex, pbstrName) {
        result := ComCall(16, this, "int", nIndex, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<Int32>} plLangID 
     * @returns {HRESULT} 
     */
    getSAMILangID(nIndex, plLangID) {
        result := ComCall(17, this, "int", nIndex, "int*", plLangID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    get_SAMIStyleCount(plCount) {
        result := ComCall(18, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    getSAMIStyleName(nIndex, pbstrName) {
        result := ComCall(19, this, "int", nIndex, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
