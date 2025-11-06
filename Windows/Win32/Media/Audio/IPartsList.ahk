#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPart.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPartsList interface represents a list of parts, each of which is an object with an IPart interface that represents a connector or subunit.
 * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nn-devicetopology-ipartslist
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IPartsList extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetPart"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipartslist-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} nIndex 
     * @returns {IPart} 
     * @see https://learn.microsoft.com/windows/win32/api/devicetopology/nf-devicetopology-ipartslist-getpart
     */
    GetPart(nIndex) {
        result := ComCall(4, this, "uint", nIndex, "ptr*", &ppPart := 0, "HRESULT")
        return IPart(ppPart)
    }
}
