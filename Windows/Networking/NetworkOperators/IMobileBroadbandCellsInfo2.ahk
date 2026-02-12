#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MobileBroadbandCellNR.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandCellsInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandCellsInfo2
     * @type {Guid}
     */
    static IID => Guid("{66205912-b89f-4e12-bbb6-d5cf09a820ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NeighboringCellsNR", "get_ServingCellsNR"]

    /**
     * @type {IVectorView<MobileBroadbandCellNR>} 
     */
    NeighboringCellsNR {
        get => this.get_NeighboringCellsNR()
    }

    /**
     * @type {IVectorView<MobileBroadbandCellNR>} 
     */
    ServingCellsNR {
        get => this.get_ServingCellsNR()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellNR>} 
     */
    get_NeighboringCellsNR() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandCellNR, value)
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellNR>} 
     */
    get_ServingCellsNR() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandCellNR, value)
    }
}
