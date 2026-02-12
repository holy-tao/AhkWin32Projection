#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Contains the custom data for one of the following PlayReady-ND messages: Registration Challenge, Registration Response, License Fetch Challenge, or License Fetch Response.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indcustomdata
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDCustomData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDCustomData
     * @type {Guid}
     */
    static IID => Guid("{f5cb0fdc-2d09-4f19-b5e1-76a0b3ee9267}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CustomDataTypeID", "get_CustomData"]

    /**
     * Gets the 16-byte type identifier for the custom data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indcustomdata.customdatatypeid
     */
    CustomDataTypeID {
        get => this.get_CustomDataTypeID()
    }

    /**
     * Gets the custom data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.indcustomdata.customdata
     */
    CustomData {
        get => this.get_CustomData()
    }

    /**
     * 
     * @param {Pointer<Pointer>} customDataTypeIDBytes 
     * @returns {HRESULT} 
     */
    get_CustomDataTypeID(customDataTypeIDBytes) {
        result := ComCall(6, this, "ptr", customDataTypeIDBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} customDataBytes 
     * @returns {HRESULT} 
     */
    get_CustomData(customDataBytes) {
        result := ComCall(7, this, "ptr", customDataBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
