#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\SecondaryTile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class ISecondaryTileStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISecondaryTileStatics
     * @type {Guid}
     */
    static IID => Guid("{99908dae-d051-4676-87fe-9ec242d83c74}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Exists", "FindAllAsync", "FindAllForApplicationAsync", "FindAllForPackageAsync"]

    /**
     * Exists (MDX)
     * @remarks
     * 1.  Measure group rows with measures containing null values contribute to **Exists** when the MeasureGroupName argument is specified. This is the difference between this form of Exists and the Nonempty function: if the NullProcessing property of these measures is set to Preserve, this means the measures will show Null values when queries are run against that part of the cube; NonEmpty will always remove tuples from a set that have Null measure values, whereas Exists with the MeasureGroupName argument will not filter tuples that have associated measure group rows, even if the measure values are Null.  
     *   
     * 2.  If *MeasureGroupName* parameter is used, results will depend on whether there are visible measures in the referenced measure group; if there are no visible measures in the referenced measure group then EXISTS will always return an empty set, regardless of the values of *Set_Expression1* and *Set_Expression2*.
     * @param {HSTRING} tileId 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/sql/ocs/docs/mdx/exists-mdx
     */
    Exists(tileId) {
        if(tileId is String) {
            pin := HSTRING.Create(tileId)
            tileId := pin.Value
        }
        tileId := tileId is Win32Handle ? NumGet(tileId, "ptr") : tileId

        result := ComCall(6, this, "ptr", tileId, "int*", &exists := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return exists
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<SecondaryTile>>} 
     */
    FindAllAsync() {
        result := ComCall(7, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, SecondaryTile), operation)
    }

    /**
     * 
     * @param {HSTRING} applicationId 
     * @returns {IAsyncOperation<IVectorView<SecondaryTile>>} 
     */
    FindAllForApplicationAsync(applicationId) {
        if(applicationId is String) {
            pin := HSTRING.Create(applicationId)
            applicationId := pin.Value
        }
        applicationId := applicationId is Win32Handle ? NumGet(applicationId, "ptr") : applicationId

        result := ComCall(8, this, "ptr", applicationId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, SecondaryTile), operation)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<SecondaryTile>>} 
     */
    FindAllForPackageAsync() {
        result := ComCall(9, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, SecondaryTile), operation)
    }
}
