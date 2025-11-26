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
     * @type {VARIANT_BOOL} 
     */
    Has608_708Caption {
        get => this.get_Has608_708Caption()
    }

    /**
     * Gets a flag indicating whether a BDA tuner device supports 608/708 closed captioning for ATSC, digital cable, or analog cable. In 608/708 closed captioning, the broadcast includes closed-captioning data.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-itunercapex-get_has608_708caption
     */
    get_Has608_708Caption() {
        result := ComCall(3, this, "short*", &pbHasCaption := 0, "HRESULT")
        return pbHasCaption
    }
}
