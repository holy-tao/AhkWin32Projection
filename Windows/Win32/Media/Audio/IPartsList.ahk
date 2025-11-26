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
     * The GetCount method gets the number of parts in the parts list.
     * @returns {Integer} Pointer to a <b>UINT</b> variable into which the method writes the parts count (the number of parts in the parts list).
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipartslist-getcount
     */
    GetCount() {
        result := ComCall(3, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * The GetPart method gets a part from the parts list.
     * @param {Integer} nIndex The part number of the part to retrieve. If the parts list contains <i>n</i> parts, the parts are numbered 0 to <i>n</i>– 1. Call the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nf-devicetopology-ipartslist-getcount">IPartsList::GetCount</a> method to get the number of parts in the list.
     * @returns {IPart} Pointer to a pointer variable into which the method writes the address of the <a href="https://docs.microsoft.com/windows/desktop/api/devicetopology/nn-devicetopology-ipart">IPart</a> interface of the part object. Through this method, the caller obtains a counted reference to the <b>IPart</b> interface. The caller is responsible for releasing the interface, when it is no longer needed, by calling the interface's <b>Release</b> method. If the <b>GetPart</b> call fails,  <i>*ppPart</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//devicetopology/nf-devicetopology-ipartslist-getpart
     */
    GetPart(nIndex) {
        result := ComCall(4, this, "uint", nIndex, "ptr*", &ppPart := 0, "HRESULT")
        return IPart(ppPart)
    }
}
