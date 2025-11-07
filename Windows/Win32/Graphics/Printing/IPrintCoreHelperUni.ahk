#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IStream.ahk
#Include .\IPrintCoreHelper.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintCoreHelperUni extends IPrintCoreHelper{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintCoreHelperUni
     * @type {Guid}
     */
    static IID => Guid("{7e8e51d6-e5ee-4426-817b-958b9444eb79}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateGDLSnapshot", "CreateDefaultGDLSnapshot"]

    /**
     * 
     * @param {Pointer<DEVMODEA>} pDevmode 
     * @param {Integer} cbSize 
     * @param {Integer} dwFlags 
     * @returns {IStream} 
     */
    CreateGDLSnapshot(pDevmode, cbSize, dwFlags) {
        result := ComCall(12, this, "ptr", pDevmode, "uint", cbSize, "uint", dwFlags, "ptr*", &ppSnapshotStream := 0, "HRESULT")
        return IStream(ppSnapshotStream)
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {IStream} 
     */
    CreateDefaultGDLSnapshot(dwFlags) {
        result := ComCall(13, this, "uint", dwFlags, "ptr*", &ppSnapshotStream := 0, "HRESULT")
        return IStream(ppSnapshotStream)
    }
}
