#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuningSpace.ahk

/**
 * The IAuxInTuningSpace interface is implemented on AuxInTuningSpace objects, which represent auxiliary video inputs such as S-video or composite video on a hardware device that is connected to the computer.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IAuxInTuningSpace)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iauxintuningspace
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IAuxInTuningSpace extends ITuningSpace{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAuxInTuningSpace
     * @type {Guid}
     */
    static IID => Guid("{e48244b8-7e17-4f76-a763-5090ff1e2f30}")

    /**
     * The class identifier for AuxInTuningSpace
     * @type {Guid}
     */
    static CLSID => Guid("{f9769a06-7aca-4e39-9cfb-97bb35f0e77e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
