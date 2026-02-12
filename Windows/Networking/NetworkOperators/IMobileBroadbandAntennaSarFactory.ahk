#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MobileBroadbandAntennaSar.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandAntennaSarFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandAntennaSarFactory
     * @type {Guid}
     */
    static IID => Guid("{a91e1716-c04d-4a21-8698-1459dc672c6e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWithIndex"]

    /**
     * 
     * @param {Integer} antennaIndex 
     * @param {Integer} sarBackoffIndex 
     * @returns {MobileBroadbandAntennaSar} 
     */
    CreateWithIndex(antennaIndex, sarBackoffIndex) {
        result := ComCall(6, this, "int", antennaIndex, "int", sarBackoffIndex, "ptr*", &antennaSar := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandAntennaSar(antennaSar)
    }
}
