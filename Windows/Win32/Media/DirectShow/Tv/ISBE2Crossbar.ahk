#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISBE2MediaTypeProfile.ahk
#Include .\ISBE2EnumStream.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableDefaultMode", "GetInitialProfile", "SetOutputProfile", "EnumStreams"]

    /**
     * 
     * @param {Integer} DefaultFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2crossbar-enabledefaultmode
     */
    EnableDefaultMode(DefaultFlags) {
        result := ComCall(3, this, "uint", DefaultFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISBE2MediaTypeProfile} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2crossbar-getinitialprofile
     */
    GetInitialProfile() {
        result := ComCall(4, this, "ptr*", &ppProfile := 0, "HRESULT")
        return ISBE2MediaTypeProfile(ppProfile)
    }

    /**
     * 
     * @param {ISBE2MediaTypeProfile} pProfile 
     * @param {Pointer<Integer>} pcOutputPins 
     * @param {Pointer<IPin>} ppOutputPins 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2crossbar-setoutputprofile
     */
    SetOutputProfile(pProfile, pcOutputPins, ppOutputPins) {
        pcOutputPinsMarshal := pcOutputPins is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pProfile, pcOutputPinsMarshal, pcOutputPins, "ptr*", ppOutputPins, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISBE2EnumStream} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-isbe2crossbar-enumstreams
     */
    EnumStreams() {
        result := ComCall(6, this, "ptr*", &ppStreams := 0, "HRESULT")
        return ISBE2EnumStream(ppStreams)
    }
}
