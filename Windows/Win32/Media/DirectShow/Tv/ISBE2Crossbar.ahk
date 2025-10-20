#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Defines crossbar functionality for a Stream Buffer Engine (SBE) version 2 (SBE2) Stream Buffer Source filter.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ISBE2Crossbar)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-isbe2crossbar
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ISBE2Crossbar extends IUnknown{
    /**
     * The interface identifier for ISBE2Crossbar
     * @type {Guid}
     */
    static IID => Guid("{547b6d26-3226-487e-8253-8aa168749434}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} DefaultFlags 
     * @returns {HRESULT} 
     */
    EnableDefaultMode(DefaultFlags) {
        result := ComCall(3, this, "uint", DefaultFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISBE2MediaTypeProfile>} ppProfile 
     * @returns {HRESULT} 
     */
    GetInitialProfile(ppProfile) {
        result := ComCall(4, this, "ptr", ppProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISBE2MediaTypeProfile>} pProfile 
     * @param {Pointer<UInt32>} pcOutputPins 
     * @param {Pointer<IPin>} ppOutputPins 
     * @returns {HRESULT} 
     */
    SetOutputProfile(pProfile, pcOutputPins, ppOutputPins) {
        result := ComCall(5, this, "ptr", pProfile, "uint*", pcOutputPins, "ptr", ppOutputPins, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISBE2EnumStream>} ppStreams 
     * @returns {HRESULT} 
     */
    EnumStreams(ppStreams) {
        result := ComCall(6, this, "ptr", ppStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
