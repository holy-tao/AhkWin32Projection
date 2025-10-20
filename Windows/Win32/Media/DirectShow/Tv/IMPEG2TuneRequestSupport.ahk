#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Indicates that the default network provider for a tuning space allows tuning through the IMPEG2TuneRequest interface as well as tuning through the native tuning request type implemented by that tuning space's CreateTuneRequest method.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMPEG2TuneRequestSupport)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-impeg2tunerequestsupport
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMPEG2TuneRequestSupport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMPEG2TuneRequestSupport
     * @type {Guid}
     */
    static IID => Guid("{1b9d5fc3-5bbc-4b6c-bb18-b9d10e3eeebf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
