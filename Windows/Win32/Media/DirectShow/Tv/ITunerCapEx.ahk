#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides information about the capabilities of a BDA device filter that represents a TV tuner. This interface extends the ITunerCap interface.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(ITunerCapEx)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-itunercapex
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class ITunerCapEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITunerCapEx
     * @type {Guid}
     */
    static IID => Guid("{ed3e0c66-18c8-4ea6-9300-f6841fdd35dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Has608_708Caption"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbHasCaption 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-itunercapex-get_has608_708caption
     */
    get_Has608_708Caption(pbHasCaption) {
        result := ComCall(3, this, "ptr", pbHasCaption, "HRESULT")
        return result
    }
}
