#Requires AutoHotkey v2.0.0 64-bit

/**
 * Query types. (D3D10_QUERY)
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_query
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_QUERY{

    /**
     * Determines whether or not the GPU is finished processing commands. When the GPU is finished processing commands <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">GetData</a> will return S_OK, and pData will point to a BOOL with a value of <b>TRUE</b>. When using this type of query, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-begin">Begin</a> is disabled.
     * @type {Integer (Int32)}
     */
    static D3D10_QUERY_EVENT => 0

    /**
     * Get the number of samples that passed the depth and stencil tests in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-begin">Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-end">End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">GetData</a> returns a UINT64. If a depth or stencil test is disabled, then each of those tests will be counted as a pass.
     * @type {Integer (Int32)}
     */
    static D3D10_QUERY_OCCLUSION => 1

    /**
     * Get a timestamp value where <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">GetData</a> returns a UINT64. This kind of query is only useful if two timestamp queries are done in the middle of a D3D10_QUERY_TIMESTAMP_DISJOINT query. The difference of two timestamps can be used to determine how many ticks have elapsed, and the D3D10_QUERY_TIMESTAMP_DISJOINT query will determine if that difference is a reliable value and also has a value that shows how to convert the number of ticks into seconds. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_query_data_timestamp_disjoint">D3D10_QUERY_DATA_TIMESTAMP_DISJOINT</a>. When using this type of query, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-begin">Begin</a> is disabled.
     * @type {Integer (Int32)}
     */
    static D3D10_QUERY_TIMESTAMP => 2

    /**
     * Determines whether or not a D3D10_QUERY_TIMESTAMP is returning reliable values, and also gives the frequency of the processor enabling you to convert the number of elapsed ticks into seconds. <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">GetData</a> will return a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_query_data_timestamp_disjoint">D3D10_QUERY_DATA_TIMESTAMP_DISJOINT</a>. This type of query should only be invoked once per frame or less.
     * @type {Integer (Int32)}
     */
    static D3D10_QUERY_TIMESTAMP_DISJOINT => 3

    /**
     * Get pipeline statistics, such as the number of pixel shader invocations in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-begin">Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-end">End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">GetData</a> will return a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_query_data_pipeline_statistics">D3D10_QUERY_DATA_PIPELINE_STATISTICS</a>.
     * @type {Integer (Int32)}
     */
    static D3D10_QUERY_PIPELINE_STATISTICS => 4

    /**
     * Similar to D3D10_QUERY_OCCLUSION, except <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">GetData</a> returns a BOOL indicating whether or not any samples passed the depth and stencil tests - <b>TRUE</b> meaning at least one passed, <b>FALSE</b> meaning none passed.
     * @type {Integer (Int32)}
     */
    static D3D10_QUERY_OCCLUSION_PREDICATE => 5

    /**
     * Get streaming output statistics, such as the number of primitives streamed out in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-begin">Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-end">End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">GetData</a> will return a <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-d3d10_query_data_so_statistics">D3D10_QUERY_DATA_SO_STATISTICS</a> structure.
     * @type {Integer (Int32)}
     */
    static D3D10_QUERY_SO_STATISTICS => 6

    /**
     * Determines whether or not any of the streaming output buffers overflowed in between <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-begin">Begin</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-end">End</a>. <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10asynchronous-getdata">GetData</a> returns a BOOL - <b>TRUE</b> meaning there was an overflow, <b>FALSE</b> meaning there was not an overflow. If streaming output writes to multiple buffers, and one of the buffers overflows, then it will stop writing to all the output buffers. When an overflow is detected by Direct3D it is prevented from happening - no memory is corrupted. This predication may be used in conjunction with an SO_STATISTICS query so that when an overflow occurs the SO_STATISTIC query will let the application know how much memory was needed to prevent an overflow.
     * @type {Integer (Int32)}
     */
    static D3D10_QUERY_SO_OVERFLOW_PREDICATE => 7
}
