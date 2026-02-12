#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MobileBroadbandCellCdma.ahk
#Include .\MobileBroadbandCellGsm.ahk
#Include .\MobileBroadbandCellLte.ahk
#Include .\MobileBroadbandCellTdscdma.ahk
#Include .\MobileBroadbandCellUmts.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandCellsInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandCellsInfo
     * @type {Guid}
     */
    static IID => Guid("{89a9562a-e472-4da5-929c-de61711dd261}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NeighboringCellsCdma", "get_NeighboringCellsGsm", "get_NeighboringCellsLte", "get_NeighboringCellsTdscdma", "get_NeighboringCellsUmts", "get_ServingCellsCdma", "get_ServingCellsGsm", "get_ServingCellsLte", "get_ServingCellsTdscdma", "get_ServingCellsUmts"]

    /**
     * @type {IVectorView<MobileBroadbandCellCdma>} 
     */
    NeighboringCellsCdma {
        get => this.get_NeighboringCellsCdma()
    }

    /**
     * @type {IVectorView<MobileBroadbandCellGsm>} 
     */
    NeighboringCellsGsm {
        get => this.get_NeighboringCellsGsm()
    }

    /**
     * @type {IVectorView<MobileBroadbandCellLte>} 
     */
    NeighboringCellsLte {
        get => this.get_NeighboringCellsLte()
    }

    /**
     * @type {IVectorView<MobileBroadbandCellTdscdma>} 
     */
    NeighboringCellsTdscdma {
        get => this.get_NeighboringCellsTdscdma()
    }

    /**
     * @type {IVectorView<MobileBroadbandCellUmts>} 
     */
    NeighboringCellsUmts {
        get => this.get_NeighboringCellsUmts()
    }

    /**
     * @type {IVectorView<MobileBroadbandCellCdma>} 
     */
    ServingCellsCdma {
        get => this.get_ServingCellsCdma()
    }

    /**
     * @type {IVectorView<MobileBroadbandCellGsm>} 
     */
    ServingCellsGsm {
        get => this.get_ServingCellsGsm()
    }

    /**
     * @type {IVectorView<MobileBroadbandCellLte>} 
     */
    ServingCellsLte {
        get => this.get_ServingCellsLte()
    }

    /**
     * @type {IVectorView<MobileBroadbandCellTdscdma>} 
     */
    ServingCellsTdscdma {
        get => this.get_ServingCellsTdscdma()
    }

    /**
     * @type {IVectorView<MobileBroadbandCellUmts>} 
     */
    ServingCellsUmts {
        get => this.get_ServingCellsUmts()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellCdma>} 
     */
    get_NeighboringCellsCdma() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandCellCdma, value)
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellGsm>} 
     */
    get_NeighboringCellsGsm() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandCellGsm, value)
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellLte>} 
     */
    get_NeighboringCellsLte() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandCellLte, value)
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellTdscdma>} 
     */
    get_NeighboringCellsTdscdma() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandCellTdscdma, value)
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellUmts>} 
     */
    get_NeighboringCellsUmts() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandCellUmts, value)
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellCdma>} 
     */
    get_ServingCellsCdma() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandCellCdma, value)
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellGsm>} 
     */
    get_ServingCellsGsm() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandCellGsm, value)
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellLte>} 
     */
    get_ServingCellsLte() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandCellLte, value)
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellTdscdma>} 
     */
    get_ServingCellsTdscdma() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandCellTdscdma, value)
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandCellUmts>} 
     */
    get_ServingCellsUmts() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandCellUmts, value)
    }
}
