#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Query types. (D3D11_QUERY)
 * @remarks
 * Create a query with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createquery">ID3D11Device::CreateQuery</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_query
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_QUERY extends Win32Enum{

    /**
     * Determines whether or not the GPU is finished processing commands. When the GPU is finished processing commands <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> will return S_OK, and pData will point to a BOOL with a value of <b>TRUE</b>. When using this type of query, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> is disabled.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_EVENT => 0

    /**
     * Get the number of samples that passed the depth and stencil tests in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> returns a UINT64. If a depth or stencil test is disabled, then each of those tests will be counted as a pass.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_OCCLUSION => 1

    /**
     * Get a timestamp value where <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> returns a UINT64. This kind of query is only useful if two timestamp queries are done in the middle of a D3D11_QUERY_TIMESTAMP_DISJOINT query. The difference of two timestamps can be used to determine how many ticks have elapsed, and the D3D11_QUERY_TIMESTAMP_DISJOINT query will determine if that difference is a reliable value and also has a value that shows how to convert the number of ticks into seconds. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_data_timestamp_disjoint">D3D11_QUERY_DATA_TIMESTAMP_DISJOINT</a>. When using this type of query, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> is disabled.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_TIMESTAMP => 2

    /**
     * Determines whether or not a D3D11_QUERY_TIMESTAMP is returning reliable values, and also gives the frequency of the processor enabling you to convert the number of elapsed ticks into seconds. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> will return a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_data_timestamp_disjoint">D3D11_QUERY_DATA_TIMESTAMP_DISJOINT</a>. This type of query should only be invoked once per frame or less.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_TIMESTAMP_DISJOINT => 3

    /**
     * Get pipeline statistics, such as the number of pixel shader invocations in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> will return a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_data_pipeline_statistics">D3D11_QUERY_DATA_PIPELINE_STATISTICS</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_PIPELINE_STATISTICS => 4

    /**
     * Similar to D3D11_QUERY_OCCLUSION, except <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> returns a BOOL indicating whether or not any samples passed the depth and stencil tests - <b>TRUE</b> meaning at least one passed, <b>FALSE</b> meaning none passed.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_OCCLUSION_PREDICATE => 5

    /**
     * Get streaming output statistics, such as the number of primitives streamed out in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> will return a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_data_so_statistics">D3D11_QUERY_DATA_SO_STATISTICS</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_SO_STATISTICS => 6

    /**
     * Determines whether or not any of the streaming output buffers overflowed in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> returns a BOOL - <b>TRUE</b> meaning there was an overflow, <b>FALSE</b> meaning there was not an overflow. If streaming output writes to multiple buffers, and one of the buffers overflows, then it will stop writing to all the output buffers. When an overflow is detected by Direct3D it is prevented from happening - no memory is corrupted. This predication may be used in conjunction with an SO_STATISTICS query so that when an overflow occurs the SO_STATISTIC query will let the application know how much memory was needed to prevent an overflow.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_SO_OVERFLOW_PREDICATE => 7

    /**
     * Get streaming output statistics for stream 0, such as the number of primitives streamed out in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> will return a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_data_so_statistics">D3D11_QUERY_DATA_SO_STATISTICS</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_SO_STATISTICS_STREAM0 => 8

    /**
     * Determines whether or not the stream 0 output buffers overflowed in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> returns a BOOL - <b>TRUE</b> meaning there was an overflow, <b>FALSE</b> meaning there was not an overflow. If streaming output writes to multiple buffers, and one of the buffers overflows, then it will stop writing to all the output buffers. When an overflow is detected by Direct3D it is prevented from happening - no memory is corrupted. This predication may be used in conjunction with an SO_STATISTICS query so that when an overflow occurs the SO_STATISTIC query will let the application know how much memory was needed to prevent an overflow.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM0 => 9

    /**
     * Get streaming output statistics for stream 1, such as the number of primitives streamed out in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> will return a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_data_so_statistics">D3D11_QUERY_DATA_SO_STATISTICS</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_SO_STATISTICS_STREAM1 => 10

    /**
     * Determines whether or not the stream 1 output buffers overflowed in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> returns a BOOL - <b>TRUE</b> meaning there was an overflow, <b>FALSE</b> meaning there was not an overflow. If streaming output writes to multiple buffers, and one of the buffers overflows, then it will stop writing to all the output buffers. When an overflow is detected by Direct3D it is prevented from happening - no memory is corrupted. This predication may be used in conjunction with an SO_STATISTICS query so that when an overflow occurs the SO_STATISTIC query will let the application know how much memory was needed to prevent an overflow.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM1 => 11

    /**
     * Get streaming output statistics for stream 2, such as the number of primitives streamed out in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> will return a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_data_so_statistics">D3D11_QUERY_DATA_SO_STATISTICS</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_SO_STATISTICS_STREAM2 => 12

    /**
     * Determines whether or not the stream 2 output buffers overflowed in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> returns a BOOL - <b>TRUE</b> meaning there was an overflow, <b>FALSE</b> meaning there was not an overflow. If streaming output writes to multiple buffers, and one of the buffers overflows, then it will stop writing to all the output buffers. When an overflow is detected by Direct3D it is prevented from happening - no memory is corrupted. This predication may be used in conjunction with an SO_STATISTICS query so that when an overflow occurs the SO_STATISTIC query will let the application know how much memory was needed to prevent an overflow.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM2 => 13

    /**
     * Get streaming output statistics for stream 3, such as the number of primitives streamed out in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> will return a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_query_data_so_statistics">D3D11_QUERY_DATA_SO_STATISTICS</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_SO_STATISTICS_STREAM3 => 14

    /**
     * Determines whether or not the stream 3 output buffers overflowed in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-begin">ID3D11DeviceContext::Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-end">ID3D11DeviceContext::End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-getdata">ID3D11DeviceContext::GetData</a> returns a BOOL - <b>TRUE</b> meaning there was an overflow, <b>FALSE</b> meaning there was not an overflow. If streaming output writes to multiple buffers, and one of the buffers overflows, then it will stop writing to all the output buffers. When an overflow is detected by Direct3D it is prevented from happening - no memory is corrupted. This predication may be used in conjunction with an SO_STATISTICS query so that when an overflow occurs the SO_STATISTIC query will let the application know how much memory was needed to prevent an overflow.
     * @type {Integer (Int32)}
     */
    static D3D11_QUERY_SO_OVERFLOW_PREDICATE_STREAM3 => 15
}
