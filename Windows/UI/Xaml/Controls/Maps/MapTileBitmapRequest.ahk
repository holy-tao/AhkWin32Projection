#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMapTileBitmapRequest.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a bitmap request for a tile for a [CustomMapTileDataSource](custommaptiledatasource.md).
 * @remarks
 * For more info about using the [CustomMapTileDataSource](custommaptiledatasource_custommaptiledatasource_1221375020.md), see the [PixelData](maptilebitmaprequest_pixeldata.md) property of the MapTileBitmapRequest.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilebitmaprequest
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class MapTileBitmapRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMapTileBitmapRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMapTileBitmapRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the bitmap data for the [CustomMapTileDataSource](custommaptiledatasource_custommaptiledatasource_1221375020.md).
     * @remarks
     * [CustomMapTileDataSource](custommaptiledatasource_custommaptiledatasource_1221375020.md) supports drawing tiles in memory and returning them as a stream of pixels. The following code sample demonstrates one approach for drawing tiles in memory.
     * 
     * ```csharp
     *         // Create new custom tile source
     *         CustomMapTileDataSource customDataSource = new CustomMapTileDataSource();
     *         customDataSource.BitmapRequested += customDataSource_BitmapRequestedAsync;
     *         customTileSource = new MapTileSource(customDataSource);
     * 
     *         /// <summary>
     *         /// BitmapRequested event handler for CustomMapTileDataSource.BitmapRequested event
     *         /// </summary>
     *         /// <param name="sender">sender</param>
     *         /// <param name="args">args for ZoomLevel, X, Y and the PixelData</param>
     *         private async void customDataSource_BitmapRequestedAsync(CustomMapTileDataSource sender, MapTileBitmapRequestedEventArgs args)
     *         {
     *             var deferral = args.Request.GetDeferral();
     *             args.Request.PixelData = await CreateBitmapAsStreamAsync();
     *             deferral.Complete();
     *         }
     * 
     *         /// <summary>
     *         /// Create memory buffer with length of 256 * 256 * 4.  
     *         /// This memory buffer is holding 256 * 256 pixels
     *         /// </summary>
     *         /// <returns>memory buffer that fills with red opaque pixels.</returns>
     *         private async Task<Windows.Storage.Streams.RandomAccessStreamReference> CreateBitmapAsStreamAsync()
     *         {
     *             int pixelHeight = 256;
     *             int pixelWidth = 256;
     *             int bpp = 4;
     * 
     *             byte[] bytes = new byte[pixelHeight * pixelWidth * bpp];
     * 
     *             for (int y = 0; y < pixelHeight; y++)
     *             {
     *                 for (int x = 0; x < pixelWidth; x++)
     *                 {
     *                     int pixelIndex = y * pixelWidth + x;
     *                     int byteIndex = pixelIndex * bpp;
     * 
     *                     bytes[byteIndex] = 0xff;        // Red
     *                     bytes[byteIndex + 1] = 0x00;    // Green
     *                     bytes[byteIndex + 2] = 0x00;    // Blue
     *                     bytes[byteIndex + 3] = 0x80;    // Alpha (0xff = fully opaque)
     *                 }
     *             }
     * 
     *             // Create RandomAccessStream from byte array
     *             InMemoryRandomAccessStream randomAccessStream = new InMemoryRandomAccessStream();
     *             IOutputStream outputStream = randomAccessStream.GetOutputStreamAt(0);
     *             DataWriter writer = new DataWriter(outputStream);
     *             writer.WriteBytes(bytes);
     *             await writer.StoreAsync();
     *             await writer.FlushAsync();
     *             return RandomAccessStreamReference.CreateFromStream(randomAccessStream);
     *         }
     * ```
     * 
     * ```cppwinrt
     * Windows::Foundation::IAsyncOperation<Windows::Storage::Streams::InMemoryRandomAccessStream> TileSources::CustomRandomAccessStreamAsync()
     * {
     *     const int pixelHeight{ 256 };
     *     const int pixelWidth{ 256 };
     *     const int bpp{ 4 };
     * 
     *     std::array<byte, pixelHeight * pixelWidth * bpp> bytes;
     * 
     *     for (int y = 0; y < pixelHeight; ++y)
     *     {
     *         for (int x = 0; x < pixelWidth; ++x)
     *         {
     *             int pixelIndex = y * pixelWidth + x;
     *             int byteIndex = pixelIndex * bpp;
     * 
     *             // Set current pixel bytes
     *             bytes[byteIndex] = (byte)(std::rand() % 256);        // Red
     *             bytes[byteIndex + 1] = (byte)(std::rand() % 256);    // Green
     *             bytes[byteIndex + 2] = (byte)(std::rand() % 256);    // Blue
     *             bytes[byteIndex + 3] = (byte)((std::rand() % 56) + 200);    // Alpha (0xff = fully opaque)
     *         }
     *     }
     * 
     *     // Create RandomAccessStream from byte array
     *     Windows::Storage::Streams::InMemoryRandomAccessStream randomAccessStream;
     *     Windows::Storage::Streams::IOutputStream outputStream{ randomAccessStream.GetOutputStreamAt(0) };
     *     Windows::Storage::Streams::DataWriter writer{ outputStream };
     *     writer.WriteBytes(bytes);
     * 
     *     co_await writer.StoreAsync();
     *     co_await writer.FlushAsync();
     * 
     *     co_return randomAccessStream;
     * }
     * ```
     * 
     * ```cppcx
     * InMemoryRandomAccessStream^ TileSources::CustomRandomAccessStream::get()
     * {
     *        int pixelHeight = 256;
     *        int pixelWidth = 256;
     *        int bpp = 4;
     *  
     *        Array<byte>^ bytes = ref new Array<byte>(pixelHeight * pixelWidth * bpp);
     *        
     *        for (int y = 0; y < pixelHeight; y++)
     *        {
     *               for (int x = 0; x < pixelWidth; x++)
     *               {
     *                      int pixelIndex = y * pixelWidth + x;
     *                      int byteIndex = pixelIndex * bpp;
     *  
     *                      // Set current pixel bytes
     *                      bytes[byteIndex] = (byte)(std::rand() % 256);        // Red
     *                      bytes[byteIndex + 1] = (byte)(std::rand() % 256);    // Green
     *                      bytes[byteIndex + 2] = (byte)(std::rand() % 256);    // Blue
     *                      bytes[byteIndex + 3] = (byte)((std::rand() % 56) + 200);    // Alpha (0xff = fully opaque)
     *               }
     *        }
     *  
     *        // Create RandomAccessStream from byte array
     *        InMemoryRandomAccessStream^ randomAccessStream = ref new InMemoryRandomAccessStream();
     *        IOutputStream^ outputStream = randomAccessStream->GetOutputStreamAt(0);
     *        DataWriter^ writer = ref new DataWriter(outputStream);
     *        writer->WriteBytes(bytes);
     *  
     *        create_task(writer->StoreAsync()).then([writer](unsigned int)
     *        {
     *               create_task(writer->FlushAsync());
     *        });
     *  
     *        return randomAccessStream;
     * }
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilebitmaprequest.pixeldata
     * @type {IRandomAccessStreamReference} 
     */
    PixelData {
        get => this.get_PixelData()
        set => this.put_PixelData(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of [MapTileBitmapRequest](maptilebitmaprequest.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Maps.MapTileBitmapRequest")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IRandomAccessStreamReference} 
     */
    get_PixelData() {
        if (!this.HasProp("__IMapTileBitmapRequest")) {
            if ((queryResult := this.QueryInterface(IMapTileBitmapRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileBitmapRequest := IMapTileBitmapRequest(outPtr)
        }

        return this.__IMapTileBitmapRequest.get_PixelData()
    }

    /**
     * 
     * @param {IRandomAccessStreamReference} value 
     * @returns {HRESULT} 
     */
    put_PixelData(value) {
        if (!this.HasProp("__IMapTileBitmapRequest")) {
            if ((queryResult := this.QueryInterface(IMapTileBitmapRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileBitmapRequest := IMapTileBitmapRequest(outPtr)
        }

        return this.__IMapTileBitmapRequest.put_PixelData(value)
    }

    /**
     * Gets a [MapTileBitmapRequestDeferral](maptilebitmaprequestdeferral.md) that the app can use to respond asynchronously to the bitmap request.
     * @returns {MapTileBitmapRequestDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.maps.maptilebitmaprequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IMapTileBitmapRequest")) {
            if ((queryResult := this.QueryInterface(IMapTileBitmapRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMapTileBitmapRequest := IMapTileBitmapRequest(outPtr)
        }

        return this.__IMapTileBitmapRequest.GetDeferral()
    }

;@endregion Instance Methods
}
