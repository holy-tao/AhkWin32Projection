#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPartsList interface represents a list of parts, each of which is an object with an IPart interface that represents a connector or subunit.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-ipartslist
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IPartsList extends IUnknown{
    /**
     * The interface identifier for IPartsList
     * @type {Guid}
     */
    static IID => Guid("{6daa848c-5eb0-45cc-aea5-998a2cda1ffb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetCount(pCount) {
        result := ComCall(3, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @param {Pointer<IPart>} ppPart 
     * @returns {HRESULT} 
     */
    GetPart(nIndex, ppPart) {
        result := ComCall(4, this, "uint", nIndex, "ptr", ppPart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
