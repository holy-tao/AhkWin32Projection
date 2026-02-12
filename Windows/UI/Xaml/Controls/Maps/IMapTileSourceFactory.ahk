#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\MapTileSource.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapTileSourceFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapTileSourceFactory
     * @type {Guid}
     */
    static IID => Guid("{cd7f811f-77fa-482b-9d34-71d31d465c48}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance", "CreateInstanceWithDataSource", "CreateInstanceWithDataSourceAndZoomRange", "CreateInstanceWithDataSourceZoomRangeAndBounds", "CreateInstanceWithDataSourceZoomRangeBoundsAndTileSize"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {MapTileSource} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(baseInterface, innerInterface) {
        result := ComCall(6, this, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapTileSource(value)
    }

    /**
     * 
     * @param {MapTileDataSource} dataSource_ 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {MapTileSource} 
     */
    CreateInstanceWithDataSource(dataSource_, baseInterface, innerInterface) {
        result := ComCall(7, this, "ptr", dataSource_, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapTileSource(value)
    }

    /**
     * 
     * @param {MapTileDataSource} dataSource_ 
     * @param {MapZoomLevelRange} zoomLevelRange 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {MapTileSource} 
     */
    CreateInstanceWithDataSourceAndZoomRange(dataSource_, zoomLevelRange, baseInterface, innerInterface) {
        result := ComCall(8, this, "ptr", dataSource_, "ptr", zoomLevelRange, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapTileSource(value)
    }

    /**
     * 
     * @param {MapTileDataSource} dataSource_ 
     * @param {MapZoomLevelRange} zoomLevelRange 
     * @param {GeoboundingBox} bounds 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {MapTileSource} 
     */
    CreateInstanceWithDataSourceZoomRangeAndBounds(dataSource_, zoomLevelRange, bounds, baseInterface, innerInterface) {
        result := ComCall(9, this, "ptr", dataSource_, "ptr", zoomLevelRange, "ptr", bounds, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapTileSource(value)
    }

    /**
     * 
     * @param {MapTileDataSource} dataSource_ 
     * @param {MapZoomLevelRange} zoomLevelRange 
     * @param {GeoboundingBox} bounds 
     * @param {Integer} tileSizeInPixels 
     * @param {IInspectable} baseInterface 
     * @param {Pointer<Object>} innerInterface 
     * @returns {MapTileSource} 
     */
    CreateInstanceWithDataSourceZoomRangeBoundsAndTileSize(dataSource_, zoomLevelRange, bounds, tileSizeInPixels, baseInterface, innerInterface) {
        result := ComCall(10, this, "ptr", dataSource_, "ptr", zoomLevelRange, "ptr", bounds, "int", tileSizeInPixels, "ptr", baseInterface, "ptr", innerInterface, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapTileSource(value)
    }
}
